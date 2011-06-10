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
			@C = []
			if(booleans[0])
				p5.size(1024,768)
			else
				p5.size(1920,1080)
			if(booleans[1])
				p5.background 255
				@C[0] = p5.color 0xffdddd
				@C[1] = p5.color 0xddffdd
				@C[2] = p5.color 0xddddff
				@C[3] = p5.color 0xffffdd
			else
				p5.background(0)
				@C[0] = p5.color 0xffff00
				@C[1] = p5.color 0x00ff00
				@C[2] = p5.color 0xff0000
				@C[3] = p5.color 0xdddd00
			if(booleans[2])
				@d = 80
			else
				@d = 120
			if(booleans[3])
				@amount = 100
			else
				@amount = 10
			for num in [1..@amount]
				p5.tint(@C[p5.floor(p5.random(4))])
				e = p5.random(80) + (@d - 40)
				p5.image(p5.img[p5.floor(p5.random(5))], p5.random(p5.width), p5.random(p5.height), e, e)
				p5.noTint
			p5.save("f65.png")
		return false;