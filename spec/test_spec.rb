describe 'action' do
  describe '#run' do
    it 'runs' do
      require 'mini_magick'

      original_icon_path = './spec/fastlane.png'

      image = MiniMagick::Image.open(original_icon_path)

      image_width = image[:width]
      image_height = image[:height]

      band_height = image_height

      text_top_margin = image_height
      text_right_margin = image_width
      text_bottom_margin = image_height
      text_left_margin = image_width

      text_icon_path = './spec/fastlane-versioned_text.png'

      text = 'test'

      MiniMagick::Tool::Convert.new do |convert|
        convert << '-background' << 'none'
        convert << '-size' << "#{image_width - (text_left_margin + text_right_margin)}x#{band_height - (text_top_margin + text_bottom_margin)}"
        convert << '-fill' << 'black'
        convert << '-gravity' << 'center'
        # using label instead of caption prevents wrapping long lines
        convert << "label:#{text}"
        convert << text_icon_path
      end
    end
  end
end