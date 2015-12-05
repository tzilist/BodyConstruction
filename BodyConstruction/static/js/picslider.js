var numList=['img1', 'img2', 'img3', 'img4', 'img5', 'img6'];
var picList=['img/cat1.jpg', 'img/cat2.jpg', 'img/cat3.jpg', 'img/cat4.jpg', 'img/cat5.jpg']
//initial list print


//function to turn array into HTML formatting
function arrayToPicForm(list) {
  var picListFunc = '<ol>';
  for (i=0; i < list.length; i++){
    picListFunc += '<li><img src="'+ list[i] + '" alt="list[i]"></li>';
  };
  picListFunc += '</ol>'
  return picListFunc;
}
document.getElementById('listDiv').innerHTML = arrayToPicForm(picList);

//function to print array with HTML formatting
function printList(list) {
  var transformHTML = '<ol>';
  for(i=0; i < list.length; i++){
    transformHTML += '<li>'+list[i]+'</li>';
  };

  transformHTML += '</ol>'
  return transformHTML;
}


//removes end of array and adds to the begining
function forwards(list) {
  varEnd = list.pop();
  list.unshift(varEnd);
  numList = list;
  document.getElementById('listDiv').innerHTML = arrayToPicForm(list);
}

//removes begining of array and adds to end
function backwards(list) {
  varEnd = list.shift();
  list.push(varEnd);
  numList = list;
  document.getElementById('listDiv').innerHTML =arrayToPicForm(list);
}


//event listeners for buttons
document.getElementById("forwards").onclick = function() {forwards(picList)};

document.getElementById("backwards").onclick = function() {backwards(picList)};
