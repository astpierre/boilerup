require 'tty-box'

module BoilerUpUtils
  def BoilerUpUtils.greet_box
    greeting = TTY::Box.frame(
      width: 34,
      height: 5,
      border: :thick,
      align: :center,
      padding: 1,
      title: {
        top_left: ' boilerup! ',
        bottom_right: 'v1.1'
      },
      style: {
        fg: :bright_yellow,
        bg: :bright_black,
        border: {
          fg: :bright_yellow,
          bg: :bright_black
        }
      }
    ) do
      "~ boilerplate 4 boilermakers ~\nby: Andrew St Pierre"
    end
    print greeting
  end
end
