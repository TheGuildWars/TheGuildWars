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
	
	check_window_height();
});

function loading(box){
	box.html("Loading...")
}

function check_window_height(){
	wh = $(window).height();
	dh = $('#main').height();
	if((dh + 60) < wh){
		$('.tgw-footer').css("margin-top", (wh - (dh + 60)))
	}
}
