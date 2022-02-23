/**
 * 
 */

$(function(){
	$("#showLogin").click(function(){
		$(location).attr("href", "signIn");
	})
	
	$("#showSearchPw").click(function(){
		$(location).attr("href", "searchPw");
	})
})