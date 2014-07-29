function generateUUID() {
    var d = new Date().getTime();
    var uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        var r = (d + Math.random()*16)%16 | 0;
        d = Math.floor(d/16);
        return (c=='x' ? r : (r&0x7|0x8)).toString(16);
    });
    return uuid;
};


function loadBranches(){
	
	
	$
	.ajax({
		url : '/questionDB/branch/all',
		type : "GET",
		success : function(
				response) {

			var branchList = "<ol>";
			var branchName = '';
			for (var i = 0; i < response.length; i++) {
				branchName = response[i].name
						.replace(
								/'/g,
								"\\'");
				//branchId = response[i].name.toString();
				branchId = response[i].id
						.toString();
				branchList += '<li><a '
						+'id='
						+branchId+'edit '
						+'data-name="name"'
						+'data-type="text"'
						+'data-pk='
						+branchId+' '
						+'data-url="/questionDB/branch/update/'
						+branchId+'"'
						+'href="javascript:viewTopics('
						+ '\''
						+ branchId
						+ '\''
						+ ','
						+ '\''
						+ branchName
						+ '\''
						+ ')">'
						+ response[i].name
						+ '</a>&nbsp;'
						+'<a  class="editable" href="javascript:makeEditable('
						+'\''
						+branchId
						+'\''
						+')">'
						+'<span class="glyphicon glyphicon-pencil"></span></a>&nbsp;'
						+'<a class="editable" href="javascript:deleteBranch('
						+'\''
						+branchId
						+'\''
						+')">'
						+'<span class="glyphicon glyphicon-trash"></span></a>';

			}

			branchList += "</ol>";
			$(
					'#branchResponse')
					.html(
							branchList);
		}
	});
}



function loadTopics(branchId){
	
	var branch_name = $('#' + branchId + 'edit').text();
	$
	.ajax({
		url : '/questionDB/branch/'
				+ branchId + '/topics',
		type : "GET",
		success : function(response) {

			var topicList = "<h4>Topics for " + branch_name
					+ "</h4><ol>";
			for (var i = 0; i < response.length; i++) {


				topicList += '<li><a id="'
						+ response[i].id
						+ 'edit" data-type="text" data-name="name" data-pk="'
						+ response[i].id
						+ '" data-url="/questionDB/branch/'
						+ branchId
						+ '/topic/edit/"  href="javascript:viewSubTopics('
						+ '\''
						+ response[i].id.replace(/'/g, "\\'")
						+ '\''
						+ ','
						+ '\''
						+ response[i].name.replace(/'/g, "\\'")
						+ '\''
						+ ')">'
						+ response[i].name
						+ '</a>'
						+ '&nbsp;<a class="editable" href="javascript:makeEditable('
						+ '\''
						+ response[i].id.replace(/'/g, "\\'")
						+ '\''
						+ ')"><span   class="glyphicon glyphicon-pencil"></span></a>&nbsp;'
						+'<a class="editable" href="javascript:deleteTopic('
						+'\''
						+branchId
						+'\''
						+','
						+'\''
						+response[i].id
						+'\''
						+')">'
						+'<span class="glyphicon glyphicon-trash"></span></a>';
			}

			topicList += "</ol>";
			$('#topicResponse').html(topicList);
	
		}

	});
	
}


function loadSubTopics(branchId,topicId){
	
	var topicName =  $('#' + topicId + 'edit').text();
	$
	.ajax({
		url : '/questionDB/branch/'
				+ branchId + '/' + topicId + '/subTopics',
		type : "GET",
		success : function(response) {
			//alert('response'+response);
			//alert('Branch Name'+branchName);
			//alert('response length'+response.length);
			var subTopicList = "<h4>Sub Topics for " + topicName
					+ "</h4><ol>";
			for (var i = 0; i < response.length; i++) {
				subTopicList += '<li><a id="'
						+ response[i].id
						+ 'edit" data-type="text" data-name="name" data-pk="'
						+ response[i].id
						+ '" data-url="/questionDB/branch/'
						+ branchId
						+ '/'
						+ topicId
						+ '/subTopic/edit/"   href="javascript:viewConcepts('
						+ '\''
						+ response[i].id.replace(/'/g, "\\'")
						+ '\''
						+ ','
						+ '\''
						+ response[i].name.replace(/'/g, "\\'")
						+ '\''
						+ ')">'
						+ response[i].name
						+ '</a>'
						+ '&nbsp;<a class="editable" href="javascript:makeEditable('
						+ '\''
						+ response[i].id.replace(/'/g, "\\'")
						+ '\''
						+ ')"><span   class="glyphicon glyphicon-pencil"></span></a>&nbsp;'
						+'<a class="editable" href="javascript:deleteSubTopic('
						+'\''
						+branchId
						+'\''
						+','
						+'\''
						+topicId
						+'\''
						+','
						+'\''
						+response[i].id
						+'\''
						+')">'
						+'<span class="glyphicon glyphicon-trash"></span></a>';

			}

			subTopicList += "</ol>";
			$('#subTopicResponse').html(subTopicList);

		}

	});
	
}


function loadConcepts(branchId,topicId,subTopicId){
	
	var subTopicName = $('#' + subTopicId + 'edit').text();
	$
	.ajax({
		url : '/questionDB/branch/'
				+ branchId + '/' + topicId + '/' + subTopicId
				+ '/concepts',
		type : "GET",
		success : function(response) {
			//alert('response'+response);
			//alert('Branch Name'+branchName);
			//alert('response length'+response.length);
			var conceptList = "<h4>Concepts for " + subTopicName
					+ "</h4><ol>";
			for (var i = 0; i < response.length; i++) {
				//conceptList += '<li><a href=#>'+response[i].name+'</a>';
				conceptList += '<li><a id="'+response[i].id+'edit" data-type="text" data-name="name" data-pk="'+response[i].id+'" data-url="/questionDB/branch/'+branchId+'/'+topicId+'/'+subTopicId+'/concept/edit/"   href=#>'
						+ response[i].name
						+ '</a>'
						+ '&nbsp;<a class="editable" href="javascript:makeEditable('
						+ '\''
						+ response[i].id.replace(/'/g, "\\'")
						+ '\''
						+ ')"><span   class="glyphicon glyphicon-pencil"></span></a>&nbsp;'
						+'<a class="editable" href="javascript:deleteConcept('
						+'\''
						+branchId
						+'\''
						+','
						+'\''
						+topicId
						+'\''
						+','
						+'\''
						+subTopicId
						+'\''
						+','
						+'\''
						+response[i].id
						+'\''
						+')">'
						+'<span class="glyphicon glyphicon-trash"></span></a>';

			}

			conceptList += "</ol>";
			$('#conceptResponse').html(conceptList);

		}

	});
	
	
}

