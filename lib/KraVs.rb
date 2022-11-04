require 'sanitize'

class KraVs
  def self.save(content, file_name: 'index.html', bypass_html: false)
    content = Sanitize.fragment(content) unless bypass_html
    File.open(file_name, 'w+') do |f|
      html = <<~HTML
      <!DOCTYPE html>
      <html lang="en">
      <head>
        <meta charset="UTF-8">
        <title>#{file_name}</title>
      </head>
        <body>
          <div class ='info'>
            #{content}
          </div>
        </body>
        </html>
      HTML
      f.write(html)
    end
  end
end
