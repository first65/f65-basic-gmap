var booleans = [];
var $index = 0;
$(function(){
	$(".option").click(function(){
		$(this).siblings(".selected").removeClass("selected");
		$(this).addClass("selected");
		if($(this).hasClass("true")){
			$(this).parent().addClass("true");
		}else{
			$(this).parent().removeClass("true");
		}
		$(".question").each(function(index){
			$index = index;
			booleans[index] = $(this).hasClass("true");
		});
	});
	$("#go").click(function(){
		$surface = Processing.getInstanceById('surface');
		$surface.make();
		return false;
	});
});