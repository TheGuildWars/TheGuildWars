$(function(){
	$('.region-link').click(function(){
		loading($('#region-box'));
		$.getScript("/regions/" + $(this).attr("data-id"));
		return false;
	});
	
	$('.world-select').live("click", function(){
		loading($('#region-box'));
		$.getScript("/users/" + $('#profile_link').attr("data-user-id") + "/set_world/" + $(this).attr("data-world-id"))
		return false;
	});
});

function loading(box){
	box.html("Loading...")
}