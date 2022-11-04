require 'sanitize'

class KraVs
  def add_content (content, file_name: 'index.html', bypass_html: false)
    @content = content
    @content = Sanitize.fragment(content).gsub(/[<>]/, '') unless bypass_html
    File.open(file_name, 'w') do |f|
      html <<~HTML
      <!DOCTYPE html>
      <html lang="en">
      <head>
        <meta charset="UTF-8">
        < title>KraVs </title>
      </head>
        <body>
          <div class ='info'>
            #{@content}
          </div>
        </body>
        </html>
      HTML
      f.write.html
    end
  end
end
s