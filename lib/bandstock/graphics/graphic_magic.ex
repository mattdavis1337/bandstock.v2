defmodule Bandstock.GraphicMagic do
	alias Bandstock.Identicon
	alias Bandstock.Identicon.Image
	alias Bandstock.Identicon.SpriteSheet
	alias ColorUtils

	def magic do
		
		folder = "assets/static/images/gridcolors/"

		magenta_off = %ColorUtils.HSV{hue: 321, saturation: 100, value: 60.0}
		red_off = %ColorUtils.HSV{hue: 0, saturation: 100, value: 60.0}
		orange_off = %ColorUtils.HSV{hue: 25, saturation: 100, value: 60.0}
		yellow_off = %ColorUtils.HSV{hue: 60, saturation: 100, value: 60.0}
		green_off = %ColorUtils.HSV{hue: 115, saturation: 100, value: 60.0}
		teal_off = %ColorUtils.HSV{hue: 170, saturation: 100, value: 60.0}
		blue_off = %ColorUtils.HSV{hue: 200, saturation: 100, value: 60.0}
		indigo_off = %ColorUtils.HSV{hue: 240, saturation: 100, value: 60.0}
		purple_off =  %ColorUtils.HSV{hue: 280, saturation: 100, value: 60.0}

		magenta_0 = %ColorUtils.HSV{hue: 321, saturation: 100, value: 85.0}
		red_0 = %ColorUtils.HSV{hue: 0, saturation: 100, value: 85.0}
		orange_0 = %ColorUtils.HSV{hue: 25, saturation: 100, value: 85.0}
		yellow_0 = %ColorUtils.HSV{hue: 60, saturation: 100, value: 85.0}
		green_0 = %ColorUtils.HSV{hue: 115, saturation: 100, value: 85.0}
		teal_0 = %ColorUtils.HSV{hue: 170, saturation: 100, value: 85.0}
		blue_0 = %ColorUtils.HSV{hue: 200, saturation: 100, value: 85.0}
		indigo_0 = %ColorUtils.HSV{hue: 240, saturation: 100, value: 85.0}
		purple_0 =  %ColorUtils.HSV{hue: 280, saturation: 100, value: 85.0}

		hueColors = [magenta_0, red_0, orange_0, yellow_0, green_0, teal_0, blue_0, indigo_0, purple_0]

		index = 0;
		#Enum.each(hueColors, fn(x) -> 

		#	place_tile(sheet, to_rgb(purple_2), index, 0)
		#	|> render_sprite_sheet("sheet1")
		#	)

		#place_tile(sheet, to_rgb(purple_2), 8, 2)
		#|> render_sprite_sheet("sheet1")

		magenta_1 = desaturate(magenta_0) |> brighten
		red_1 = desaturate(red_0)|> brighten
		orange_1 = desaturate(orange_0)|> brighten
		yellow_1 = desaturate(yellow_0)|> brighten
		green_1 = desaturate(green_0)|> brighten
		teal_1 = desaturate(teal_0)|> brighten
		blue_1 = desaturate(blue_0)|> brighten
		indigo_1 = desaturate(indigo_0)|> brighten
		purple_1 =  desaturate(purple_0)|> brighten

		magenta_2 = desaturate(magenta_1) |> brighten
		red_2 = desaturate(red_1)|> brighten
		orange_2 = desaturate(orange_1)|> brighten
		yellow_2 = desaturate(yellow_1)|> brighten
		green_2 = desaturate(green_1)|> brighten
		teal_2 = desaturate(teal_1)|> brighten
		blue_2 = desaturate(blue_1)|> brighten
		indigo_2 = desaturate(indigo_1)|> brighten
		purple_2 =  desaturate(purple_1)|> brighten

		magenta_3 = desaturate(magenta_2) |> brighten
		red_3 = desaturate(red_2)|> brighten
		orange_3 = desaturate(orange_2)|> brighten
		yellow_3 = desaturate(yellow_2)|> brighten
		green_3 = desaturate(green_2)|> brighten
		teal_3 = desaturate(teal_2)|> brighten
		blue_3 = desaturate(blue_2)|> brighten
		indigo_3 = desaturate(indigo_2)|> brighten
		purple_3 =  desaturate(purple_2)|> brighten
		

		magenta2 = %ColorUtils.HSV{hue: 320, saturation: 100, value: 100.0}
		red2 = %ColorUtils.HSV{hue: 0, saturation: 100, value: 100.0}
		orange2 = %ColorUtils.HSV{hue: 40, saturation: 100, value: 100.0}
		yellow2 = %ColorUtils.HSV{hue: 80, saturation: 100, value: 100.0}
		green2 = %ColorUtils.HSV{hue: 120, saturation: 100, value: 100.0}
		teal2 = %ColorUtils.HSV{hue: 160, saturation: 100, value: 100.0}
		blue2 = %ColorUtils.HSV{hue: 200, saturation: 100, value: 100.0}
		indigo2 = %ColorUtils.HSV{hue: 240, saturation: 100, value: 100.0}
		purple2 =  %ColorUtils.HSV{hue: 280, saturation: 100, value: 100.0}
		



		#hueColors = [magenta, red, orange, yellow, green, teal, blue, indigo, purple]
		#hueColors = [magenta2, red2, orange2, yellow2, green2, teal2, blue2, indigo2, purple2]

		sheet = %SpriteSheet{countX: 9, countY: 5, egd: :egd.create(300*9, 400*5)}


		place_tile(sheet, to_rgb(magenta_0), 0, 0)
		place_tile(sheet, to_rgb(red_0), 1, 0)
		place_tile(sheet, to_rgb(orange_0), 2, 0)
		place_tile(sheet, to_rgb(yellow_0), 3, 0)
		place_tile(sheet, to_rgb(green_0), 4, 0)
		place_tile(sheet, to_rgb(teal_0), 5, 0)
		place_tile(sheet, to_rgb(blue_0), 6, 0)
		place_tile(sheet, to_rgb(indigo_0), 7, 0)
		place_tile(sheet, to_rgb(purple_0), 8, 0)
		place_tile(sheet, to_rgb(magenta_1), 0, 1)
		place_tile(sheet, to_rgb(red_1), 1, 1)
		place_tile(sheet, to_rgb(orange_1), 2, 1)
		place_tile(sheet, to_rgb(yellow_1), 3, 1)
		place_tile(sheet, to_rgb(green_1), 4, 1)
		place_tile(sheet, to_rgb(teal_1), 5, 1)
		place_tile(sheet, to_rgb(blue_1), 6, 1)
		place_tile(sheet, to_rgb(indigo_1), 7, 1)
		place_tile(sheet, to_rgb(purple_1), 8, 1)
		place_tile(sheet, to_rgb(magenta_2), 0, 2)
		place_tile(sheet, to_rgb(red_2), 1, 2)
		place_tile(sheet, to_rgb(orange_2), 2, 2)
		place_tile(sheet, to_rgb(yellow_2), 3, 2)
		place_tile(sheet, to_rgb(green_2), 4, 2)
		place_tile(sheet, to_rgb(teal_2), 5, 2)
		place_tile(sheet, to_rgb(blue_2), 6, 2)
		place_tile(sheet, to_rgb(indigo_2), 7, 2)
		place_tile(sheet, to_rgb(purple_2), 8, 2)
		place_tile(sheet, to_rgb(magenta_3), 0, 3)
		place_tile(sheet, to_rgb(red_3), 1, 3)
		place_tile(sheet, to_rgb(orange_3), 2, 3)
		place_tile(sheet, to_rgb(yellow_3), 3, 3)
		place_tile(sheet, to_rgb(green_3), 4, 3)
		place_tile(sheet, to_rgb(teal_3), 5, 3)
		place_tile(sheet, to_rgb(blue_3), 6, 3)
		place_tile(sheet, to_rgb(indigo_3), 7, 3)
		place_tile(sheet, to_rgb(purple_3), 8, 3)
		place_tile(sheet, to_rgb(magenta_off), 0, 4)
		place_tile(sheet, to_rgb(red_off), 1, 4)
		place_tile(sheet, to_rgb(orange_off), 2, 4)
		place_tile(sheet, to_rgb(yellow_off), 3, 4)
		place_tile(sheet, to_rgb(green_off), 4, 4)
		place_tile(sheet, to_rgb(teal_off), 5, 4)
		place_tile(sheet, to_rgb(blue_off), 6, 4)
		place_tile(sheet, to_rgb(indigo_off), 7, 4)
		place_tile(sheet, to_rgb(purple_off), 8, 4)
		|> render_sprite_sheet("sheet1")

		place_tile(sheet, to_rgb(magenta2), 0, 0)
		place_tile(sheet, to_rgb(red2), 1, 0)
		place_tile(sheet, to_rgb(orange2), 2, 0)
		place_tile(sheet, to_rgb(yellow2), 3, 0)
		place_tile(sheet, to_rgb(green2), 4, 0)
		place_tile(sheet, to_rgb(teal2), 5, 0)
		place_tile(sheet, to_rgb(blue2), 6, 0)
		place_tile(sheet, to_rgb(indigo2), 7, 0)
		place_tile(sheet, to_rgb(purple2), 8, 0)
		|> render_sprite_sheet("sheet2")
		#draw_tile(to_rgb(magenta))
		#|> place_tile(sheet)

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

		

		#colors = Enum.with_index(colors)
		#rainbow = Enum.with_index(rainbow)
		
		#Enum.each(colors, fn color -> 
		#	draw_image(color) 
		#end)

		#Enum.each(rainbow, fn color -> 
		#	draw_image(color) 
		#end)

		image = Identicon.main("hashgod")
	end

	def render_sprite_sheet(sprite_sheet, filename) do
		File.write("#{filename}.png", :egd.render(sprite_sheet.egd))
	end

	def brighten(color) do
		%ColorUtils.HSV{value: value} = color
		%ColorUtils.HSV{color | value: value+5}
	end

	def desaturate(color) do
		%ColorUtils.HSV{saturation: saturation} = color
		%ColorUtils.HSV{color | saturation: saturation-5}
	end

	def to_rgb(hsv) do
		rgb = ColorUtils.hsv_to_rgb(hsv)
		%ColorUtils.RGB{red: red, blue: blue, green: green} = rgb
		IO.inspect({red, green, blue})
		{red, green, blue}
	end

	def place_tile(sprite_sheet, color, x, y) do
		height = 400
		width = 300
		fill = :egd.color(color)
		:egd.filledRectangle(sprite_sheet.egd, {width*x, height*y}, {width*x+width, height*y+height}, fill)
		sprite_sheet
	end

	def draw_tile(color) do
		render_rect(color, 300, 400)
	end

	def render_rect(color, width, height) do
		new_tile = :egd.create(width, height)
		fill = :egd.color(color)
		:egd.filledRectangle(new_tile, {0,0}, {width,height}, fill)
		new_tile
	end

	def draw_image(color_in) do
		{color, index} = color_in

		image = get_file_name(%Image{}, index, color)
		|> render_image()
		#|> save_image()

		sprite_sheet = %SpriteSheet{}
		place_image(sprite_sheet, image, 0, 0)


		image
	end

	def get_file_name(image, index, color) do
		folder = "assets/static/images/gridcolors/"
		#val = Enum.reduce color, Integer.to_string(index), fn(num, acc) ->
		#	acc <> "-" <> Integer.to_string(num)
		#end

		%Image{color: List.to_tuple(color), filename: folder <> "teal-" <> Integer.to_string(index)}
	end

	def render_image(image) do
		%Image{color: color} = image
	    new_image = :egd.create(100, 168)
	    fill = :egd.color(color)
	    black = :egd.color({0,0,0})
	    :egd.filledRectangle(new_image, {0,0}, {250,250}, fill)
	    %Image{image | image: :egd.render(new_image)}
    end

    def place_image(sprite_sheet, image, x, y) do
    	%SpriteSheet{lastPlaced: lastPlaced} = sprite_sheet;
    	if lastPlaced == nil do lastPlaced = {0,0} end
    	sprite_sheet = %SpriteSheet{sprite_sheet | lastPlaced: lastPlaced, spriteSizeX: 100, spriteSizeY: 168, countX: 10, countY: 4}

    	%Image{color: color} = image
    	new_image = :egd.create(100, 168)
    	fill = :egd.color(color)
 		:egd.filledRectangle(new_image, {0,0}, {sprite_sheet.spriteSizeX,sprite_sheet.spriteSizeY}, fill)
 		sprite_sheet = %SpriteSheet{sprite_sheet | sheet: sprite_sheet.sheet ++ [new_image]}

    	IO.puts("+++lastPlaced")
    	IO.inspect(sprite_sheet)

    	sprite_sheet
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