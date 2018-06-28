class HomeController < ApplicationController
  before_action :set_post, only: [:show]


  def index
    @postdesc = Post.where(["publish = ? ",true]).order("created_at DESC").limit(5)
    @postasc = Post.where(["publish = ? ",true]).order("created_at ASC").limit(5)
    @posts = Post.distinct.pluck(:year)
    @tags = Tag.all

  end

  

  def about
  end

  def contact
  end

  def postold
    @posts = Post.where(["publish = ? ",true]).order("created_at ASC").paginate(page: params[:page],per_page: 8)
  end

  def postnew
    @posts = Post.where(["publish = ? ",true]).order("created_at DESC").paginate(page: params[:page],per_page: 8)
  end
  def show
    
    #tìm các post có slug = slug đưa vào
    @post = Post.find_by(slug: params[:slug])
    # thêm comment và show tất cả comment
    @comments = @post.comments.where(["parents_id = ?",0]).order("created_at DESC").paginate(page: params[:page],per_page: 5)
    @commentsize = @post.comments.where(["parents_id = ?",0]).size
    @comment = @post.comments.build
    begin
      @user = @post.user
      @arr = Array.new
      @arr1 = Array.new
  # Đưa hết id của post tìm được với tagname vào mảng arr và sử dụng uniq để loại bỏ các giá trị trùng nhau
      @t = @post.all_tags
      #ta có @t là 1 chuỗi gồm các tag
      @tags = @t.split(', ')
    #ta sử dụng split để tách chuỗi thành mảng, sau đó tìm kiếm tất cả id của các post có cùng tagname
    # gán vào 1 mảng và sử dụng uniq! để loại bỏ các giá trị trùng lặp
      @tags.each do |tg|
        Tag.find_by(tagname: tg).posts.ids.each do |id|
          @arr = @arr.push(id)
        end
        @arr.uniq!
      end
      # Sau đó đẩy vào mảng @arr1 để giới hạn bài liên quan, chỉ hiển thị 4 đầu bài thôi
      for i in 0..3
        @arr1 = @arr1.push(@arr[i])
      end
    rescue
      redirect_to root_path
    end

  end
  def search
    @posts = Post.where(["publish = ? and title like ?",true, "%#{params[:search]}%"]).paginate(page: params[:page],per_page: 7)

  end
  def tag
    @posts = Post.tagged_with(params[:tag]).where(["publish = ? ",true]).paginate(page: params[:page],per_page: 8)
  end
  def year
    @posts = Post.where(["publish = ? and year = ?", true, params[:year]]).paginate(page: params[:page],per_page: 8)
  end
  private
  def set_post
    @post = Post.find_by(slug: params[:slug])
  end
  
  
end
