function addComment(user, text){
	let html = $(`<div class="comment">
						<div class="user-info">
							<div><img src="${user.avatar}"></div>
							<div class="username">${user.username}</div>
						</div>
						<div class="text">${text}</div>
                    </div>`
				);
	$("#comments .comments-list").append(html);
}		

jQuery(document).ready(function($){
	$.ajax({
			type: 'GET',
			url: '/frontend/index.php?model=comment&action=index&product_id=3231',
			dataType: 'json',
			success: function (comments) {
				console.groupCollapsed('Ajax', comments)

				for (let index in comments) {
					let comment = comments[index];

					let user = {
						username: comment.username,
						avatar: comment.avatar
					}
					addComment(user, comment.comment);
				}
			},
			error: function (data) {
				console.error(data)
			}
		});

/*	const comments = [
			{
				userInfo:{
					avatar: '/frontend/img/avatar.jpg',
					username: 'Username1',
				},
				text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen'
			},
			{
				userInfo: {
					avatar: '/frontend/img/avatar.jpg',
					username: 'Alex'
				},
				text: 'Cool Book!'
			},
		];*/
	
		$("#comment-form").submit(function(event){
			event.stopPropagation();
			
				let user = {
					username: $(this).find('input[name=username]').val(),
					email: $(this).find('input[name=email]').val(),
					avatar: '/frontend/img/avatar.jpg'
				}
				let text = $(this).find('textarea[name=message]').val();
				
				//Add comment
				addComment(user,text)
				
				//Clear form
				$(this).find('input[name=username]').val(''),
				$(this).find('input[name=email]').val(''),
				$(this).find('textarea[name=message]').val('');
				
				return false;
			});
		
	/*$("#comments .comment").each(function(){
		console.log($(this).find('.text').text())
	});*/


});