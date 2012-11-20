// http://tech.kayac.com/archive/javascript-url-dispatcher.html

function dispatcher (path, func) {
  dispatcher.path_func = dispatcher.path_func || [];
  if (func) return dispatcher.path_func.push([path, func]);
  for(var i = 0, l = dispatcher.path_func.length; i < l; ++i) {
    var func = dispatcher.path_func[i];
    var match = path.match(func[0]);
    match && func[1](match);
  };
};

jQuery(function($){
  dispatcher(location.pathname);
});
