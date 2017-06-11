var init_friend_lookup;

init_friend_lookup = function(){

	$('#friend-lookup-form').on('ajax:before', function(event, data, status){
		show_spinner();
	});

	$('#friend-lookup-form').on('ajax:after', function(event, data, status){
		hide_spinner();
	});
	
	$('#friend-lookup-form').on('ajax:success', function(event, data, status){
		if(data){
			$('#friend-lookup').replaceWith(data);
			init_friend_lookup();
		}else{
			$('#friend-lookup-results').replaceWith('');
			$('#friend-lookup-errors').replaceWith("friend not found");
			hide_spinner();
		}

	});

	$('#friend-lookup-form').on('ajax:error', function(event, xhr, status, error){
		$('#friend-lookup-results').replaceWith('');
		$('#friend-lookup-errors').replaceWith("friend not found");
	});

}

$(document).ready(function(){
	init_friend_lookup();
});