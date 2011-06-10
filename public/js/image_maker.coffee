f65_sketch = (p5) ->
	p5.setup = () ->
		@img = [p5.loadImage("/img/flower.png"), p5.loadImage("/img/softstar.png"), p5.loadImage("/img/circles.png"), p5.loadImage("/img/splat.png"), p5.loadImage("/img/splat2.png")]
		p5.noLoop()
	p5.draw = () ->
$(document).ready ->
	canvas = $("#surface");
	p5 = new Processing canvas[0], f65_sketch
	booleans = []
	$(".option").bind 'click', (event) ->
		$(this).siblings(".selected").removeClass("selected")
		$(this).addClass("selected")
		if($(this).hasClass("true"))
			$(this).parent().addClass("true")
		else
			$(this).parent().removeClass("true")
		$(".question").each (index) ->
			booleans[index] = $(this).hasClass("true")
	$("#go").bind 'click', (event) ->
			if(booleans[0] == true)
				p5.size(1024,768)
			else
				p5.size(1920,1080)
			if(booleans[1] == true)
				p5.background 0xffdddd
				@C = p5.color 255
			else
				p5.background(0)
				@C = p5.color 255, 255, 0
			if(booleans[2] == true)
				@d = 80
			else
				@d = 120
			for num in [1..65]
				p5.tint(@C)
				e = p5.random(40) + (@d - 20)
				p5.image(p5.img[p5.floor(p5.random(5))], p5.random(p5.width), p5.random(p5.height), e, e)
				p5.noTint
			p5.save("f65.png")
		return false;