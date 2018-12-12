class BlogMailer < ApplicationMailer
  def blog_mail(blog)
    @blog = blog

    mail to: "localhost:3000", subject: "新しいブログ投稿完了の確認"
  end
end
