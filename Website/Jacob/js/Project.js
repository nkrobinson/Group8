var labelType, useGradients, nativeTextSupport, animate, st;

(function() {
  var ua = navigator.userAgent,
      iStuff = ua.match(/iPhone/i) || ua.match(/iPad/i),
      typeOfCanvas = typeof HTMLCanvasElement,
      nativeCanvasSupport = (typeOfCanvas == 'object' || typeOfCanvas == 'function'),
      textSupport = nativeCanvasSupport 
        && (typeof document.createElement('canvas').getContext('2d').fillText == 'function');
  //I'm setting this based on the fact that ExCanvas provides text support for IE
  //and that as of today iPhone/iPad current text support is lame
  labelType = (!nativeCanvasSupport || (textSupport && !iStuff))? 'Native' : 'HTML';
  nativeTextSupport = labelType == 'Native';
  useGradients = nativeCanvasSupport;
  animate = !(iStuff || !nativeCanvasSupport);
})();

function getStart(){
	$.ajax({
		url: "lib/api.php",
		type: "POST",
		data: {
			//ALL DATA HERE.
			type:2
		},
		dataType: "JSON",
		success: function (jso) {
			//CHECK IN INSPECT ELEMENTS WHAT IS RETURNED
			$('.loader').fadeOut(300);
			var json=jso;
			for(var i=0;i<json.length;i++){
				$('.selection').append("<div class='item' data-id='"+json[i]['id']+"'>"+json[i]['name']+"</div>");
			}
			$('.selection .item').on('click', function(){
				$('.selection .item').fadeOut(200);
				init($(this).data('id'));
				//$('.loader').fadeIn(200);
			});
		}
	});
}

function getData(id){
	$.ajax({
		url: "lib/api.php",
		type: "POST",
		data: {
			//ALL DATA HERE.
			type:1,
			//university ID here:
			university:1
		},
		dataType: "JSON",
		success: function (jso) {
			//CHECK IN INSPECT ELEMENTS WHAT IS RETURNED
			$('.loader').fadeOut(300);
			var json=jso;
			
		}
	});
}
function init(id){
	startAnimation();
    //init data
	$.ajax({
		url: "lib/api.php",
		type: "POST",
		data: {
			//ALL DATA HERE.
			type:1,
			//university ID here:
			university:id
		},
		dataType: "JSON",
		success: function (jso) {
			//CHECK IN INSPECT ELEMENTS WHAT IS RETURNED
			console.log(JSON.stringify(jso));
			$('.loader').fadeOut(300);
			var json=jso;
			
			/*var json = "{id:\"node01\", name:\"ROOT\", data:{}, children:[{id:\"node02\", name:\"TWO\", data:{}, children:[]}, {id:\"node03\", name:\"THREE\", data:{}, children:[]}]}";
			var json_children ="[{id:\"node05\", name:\"Five\", data:{}, children:[]}]";
			var json_children2 ="[{id:\"node05\", name:\"Five\", data:{}, children:[]}, {id:\"node06\", name:\"Six\", data:{}, children:[]}]";*/
			//START OUR TREE
			//A client-side tree generator
			
			//load json data
			st.loadJSON(json);
			//compute node positions and layout
			st.compute();
			st.geom.translate(new $jit.Complex(-200, 0), "current"); 
			//emulate a click on the root node.
			st.onClick(st.root);
			//end
			
		}
	});
    
}
function startAnimation(){
	var getTree = (function() {
		var i = 0;
		return function(nodeId, level) {
			//JSON here to get all data from DB searching by nodeID
			$.ajax({
				url: "lib/api.php",
				type: "POST",
				data: {
					//ALL DATA HERE.
					type:3,
					id:nodeId
				},
				dataType: "JSON",
				success: function (jso) {
					//CHECK IN INSPECT ELEMENTS WHAT IS RETURNED
					//$('.loader').fadeOut(300);
					var json=jso;
					$('.selected-node').html($('#'+nodeId).text()+" at:<div class='holder'></div>").animate({'left':'600px', 'opacity':1}, 300);
					
					for(var i=0;i<json.length;i++){
						$('.selected-node .holder').append("<a href='"+json[i]['description']+"' target='_blank'>"+json[i]['name']+"</a><br />");
					}
					$('.selected-node .holder').css('background', 'none');
					
				}
		
			});
			$('#center-container').animate({'left':'0px'}, 300);
			/*var current_json=json_children2;
			if(nodeId=="node02")
				current_json=json_children;
			var subtree = eval('(' + current_json.replace(/id:\"([a-zA-Z0-9]+)\"/g, 
			function(all, match) {
				return "id:\"" + match + "_" + i + "\""  
				}) + ')');
				$jit.json.prune(subtree, level); i++;
				return {
				'id': nodeId,
				'children': subtree
			};*/
		};
	})();
	
	//Implement a node rendering function called 'nodeline' that plots a straight line
	//when contracting or expanding a subtree.
	$jit.ST.Plot.NodeTypes.implement({
		'nodeline': {
		  'render': function(node, canvas, animating) {
				if(animating === 'expand' || animating === 'contract') {
				  var pos = node.pos.getc(true), nconfig = this.node, data = node.data;
				  var width  = nconfig.width, height = nconfig.height;
				  var algnPos = this.getAlignedPos(pos, width, height);
				  var ctx = canvas.getCtx(), ort = this.config.orientation;
				  ctx.beginPath();
				  if(ort == 'left' || ort == 'right') {
					  ctx.moveTo(algnPos.x, algnPos.y + height / 2);
					  ctx.lineTo(algnPos.x + width, algnPos.y + height / 2);
				  } else {
					  ctx.moveTo(algnPos.x + width / 2, algnPos.y);
					  ctx.lineTo(algnPos.x + width / 2, algnPos.y + height);
				  }
				  ctx.stroke();
			  } 
		  }
		}
		  
	});

	//init Spacetree
	//Create a new ST instance
	st = new $jit.ST({
		'injectInto': 'infovis',
		//set duration for the animation
		duration: 300,
		//set animation transition type
		transition: $jit.Trans.Quart.easeInOut,
		//set distance between node and its children
		levelDistance: 50,
		//set max levels to show. Useful when used with
		//the request method for requesting trees of specific depth
		levelsToShow: 1,
		//set node and edge styles
		//set overridable=true for styling individual
		//nodes or edges
		orientation: 'left',
		Node: {  
			height: 30,  
			width: 120,  
			type: 'rectangle',  
			color: '#aaa',  
			overridable: true  
		},
		  
		Edge: {  
			type: 'bezier',  
			overridable: true  
		}, 
		
		//Add a request method for requesting on-demand json trees. 
		//This method gets called when a node
		//is clicked and its subtree has a smaller depth
		//than the one specified by the levelsToShow parameter.
		//In that case a subtree is requested and is added to the dataset.
		//This method is asynchronous, so you can make an Ajax request for that
		//subtree and then handle it to the onComplete callback.
		//Here we just use a client-side tree generator (the getTree function).
		request: function(nodeId, level, onComplete) {
		  var ans = getTree(nodeId, level);
		  onComplete.onComplete(nodeId, ans);  
		},
		
		//This method is called on DOM label creation.
		//Use this method to add event handlers and styles to
		//your node.
		onCreateLabel: function(label, node){
			label.id = node.id;            
			label.innerHTML = node.name;
			label.onclick = function(){
				st.onClick(node.id);
			};
        	//set label styles  
			var style = label.style;  
			style.width = 120 + 'px';  
			style.height = 27 + 'px';              
			style.cursor = 'pointer';  
			style.color = '#333';  
			style.fontSize = '1em';  
			style.textAlign= 'center';  
			style.paddingTop = '5px';  
		},
		
		//This method is called right before plotting
		//a node. It's useful for changing an individual node
		//style properties before plotting it.
		//The data properties prefixed with a dollar
		//sign will override the global node style properties.
		onBeforePlotNode: function(node){
			if (node.selected) {  
				node.data.$color = "#ff7";  
			}  
			else {  
				delete node.data.$color;  
				//if the node belongs to the last plotted level  
				if(!node.anySubnode("exist")) {  
					//count children number  
					var count = 0;  
					node.eachSubnode(function(n) { count++; });  
					//assign a node color based on  
					//how many children it has  
					node.data.$color = ['#aaa', '#baa', '#caa', '#daa', '#eaa', '#faa'][count];                      
				}  
			}  
		},
		
		//This method is called right before plotting
		//an edge. It's useful for changing an individual edge
		//style properties before plotting it.
		//Edge data proprties prefixed with a dollar sign will
		//override the Edge global style properties.
		onBeforePlotLine: function(adj){
			if (adj.nodeFrom.selected && adj.nodeTo.selected) {  
				adj.data.$color = "#eed";  
				adj.data.$lineWidth = 3;  
			}  
			else {  
				delete adj.data.$color;  
				delete adj.data.$lineWidth;  
			} 
		}
	});
}