defmodule Bandstock.GraphicMagic do
	alias Bandstock.Identicon
	alias Bandstock.Identicon.Image
	alias ColorUtils

	def magic do
		
		folder = "assets/static/images/gridcolors/"

		colors = [
			[0, 38, 38], [0, 87, 87], [1, 95, 95], 
			[1, 112, 112], [2, 120, 120], [12, 148, 148], 
			[24, 168, 168], [44, 191, 191], [67, 209, 209],
			[102, 227, 227], [146, 240, 240], [191, 255, 255]
		]

		rainbow = [
					[228, 14, 153], [230, 28, 28], [253, 130, 39], 
					[229, 230, 0], [145, 230, 28], [28, 230, 31], 
					[28, 230, 252], [27, 184, 229], [28, 54, 230], 
					[155, 22, 229]
				]

		

		colors = Enum.with_index(colors)
		rainbow = Enum.with_index(rainbow)
		
		Enum.each(colors, fn color -> 
			draw_image(color) 
		end)

		Enum.each(rainbow, fn color -> 
			draw_image(color) 
		end)

		image = Identicon.main("hashgod")
	end

	def get_file_name(image, index, color) do
		folder = "assets/static/images/gridcolors/"
		#val = Enum.reduce color, Integer.to_string(index), fn(num, acc) ->
		#	acc <> "-" <> Integer.to_string(num)
		#end

		image = %Image{color: List.to_tuple(color), filename: folder <> "teal-" <> Integer.to_string(index)}
		image
	end

	def draw_image(color_in) do
		{color, index} = color_in
		image = get_file_name(%Image{}, index, color)
		|> render_image()
		|> save_image()

		image
	end

	def render_image(image) do
		%Image{color: color} = image
	    new_image = :egd.create(250, 250)
	    fill = :egd.color(color)
	    black = :egd.color({0,0,0})
	    :egd.filledRectangle(new_image, {0,0}, {250,250}, fill)
	    %Image{image | image: :egd.render(new_image)}
    end

    def save_image(image) do
    	%Image{image: image, filename: filename} = image
    	IO.puts("writing file #{filename}.png")
    	res = File.write("#{filename}.png", image)

    	case res do
    		:ok ->
    			IO.puts("Saving Image: Ok")
    		{:error, thing} ->
    			IO.puts("Saving Image: Error")
    			IO.inspect(thing)
    	end

    	image
  	end

end