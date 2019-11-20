//移动端自适应
function htRem() {
  var ww = document.documentElement.clientWidth; //获取当前窗口大小
  if (ww > 750) {
    ww = 750;
  }
  document.documentElement.style.fontSize = ww / 26 + "px";
}
htRem();
window.onresize = function() {
  htRem();
};