$(function () {
  // 游戏中心背景图片切换
  var $game_item = $('.game-center').find('.all').find('a');
  var $gameImg = $('#gameImg');

  var urlArr = ['game-list__img1.png', 'game-list__img2.png', 'game-list__img3.png', 'game-list__img4.png', 'game-list__img5.png', 'game-list__img6.png', 'game-list__img7.png'];

  $game_item.hover(function () {
    $gameImg.attr('style', 'background-image: url(images/cont/'+urlArr[$(this).index()]+')');
  }, function () {
    $gameImg.attr('style', '');
  });


  // 搜索框结果返回
  var $search_text = $('#search').find('.text');
  var $search_history = $('#search').find('.search-history');

  $search_text.focus(function () {
    $search_history.show();
  });

  $search_text.click(function () {
    return false;
  });

  $(document).click(function () {
    $search_history.hide();
  });


  // 幻灯片
  var $aSlider = $('.slider');

  $aSlider.each(function () {
    $aSlider.slider($(this));
  });

  // 选项卡切换
  var $js_tab = $('[js-tab]');

  $js_tab.each(function () {
    $(this).tab();
  });

  // 右侧导航条
  var $sideBar = $('#sideBar');

  $(window).scroll(function () {
    sideBar();
  });

  function sideBar() {
    if ($('#banner').offset().top <= $(this).scrollTop()) {
      $sideBar.css({top: 0});
    } else {
      $sideBar.css({top: 232});
    }
  };
  sideBar();

  // 返回顶部
  $('#backTop').backTop();

  // 侧边导航跳转
  var $mainCont_item = $('[js-move]');
  var $sideBar_btn = $('.sideBar-list').find('a').not($('.sideBar-list').find('a').last());

  $(document.body).animate({scrollTop: 0});

  $sideBar_btn.click(function () {
    var index = $(this).index();

    $(this).addClass('cur').siblings().removeClass('cur');

    $(document.body).stop().animate({scrollTop: $mainCont_item.eq(index).offset().top});

    return false;
  });

  $(window).scroll(function () {
    $mainCont_item.each(function (i) {

      if ($(window).scrollTop() > $mainCont_item.eq(i).offset().top - 300) {
        $sideBar_btn.eq(i).addClass('cur').siblings().removeClass('cur');
      }

      if ($(window).scrollTop() < 500) {
        $sideBar_btn.removeClass('cur');
      }

    });
  });


  // 固定导航条
  var main_w = $mainCont_item.width();
  var $sideBar = $('#sideBar');
  var sideBar_w = $sideBar.width();

  $sideBar.css({left: widthChanged($(window).width())});

  $(window).resize(function () {
    if ($(window).width() <= main_w) {
      $sideBar.css({left: 'auto', right: 0});  
    } else {
      $sideBar.css({left: widthChanged($(this).width()), right: 'auto'});
    }
  });

  function widthChanged(w) {
    return (w - main_w) / 2 + main_w + 10;
  };

});

;(function ($, window, document, undefined) {

  $.fn.slider = function (obj) {
    var $oSlider = obj;
    var $slider_item = $oSlider.find('.slider-img').find('a');
    var $slider_btn = $oSlider.find('.slider-btn').find('span');
    var $slider_title = $oSlider.find('.slider-title').find('p');

    var data_title = [];
    var slider_w = $slider_item.eq(0).width();
    var slider_iNum = 0;

    $slider_item.each(function () {
      data_title.push($(this).attr('slider-title'));
    });

    for (var i = 1; i < $slider_item.length; i++) {
      $($slider_item[i]).css({left: slider_w});
    }

    $slider_btn.click(function () {
      sliderBtn($(this).index());

      sliderChange($(this).index());

      slider_iNum = $(this).index();

      $slider_title.text(data_title[$(this).index()]);
    });

    function sliderBtn(index) {
      $slider_btn.removeClass('cur');
      $slider_btn.eq(index).addClass('cur');
    };

    function sliderChange(curIndex) {
      if (curIndex === slider_iNum) {
        return;
      } else if (curIndex > slider_iNum) {
        $slider_item.eq(slider_iNum).animate({left: -slider_w});
        $slider_item.eq(curIndex).css({left: slider_w});
      } else if (curIndex < slider_iNum) {
        $slider_item.eq(slider_iNum).animate({left: slider_w});
        $slider_item.eq(curIndex).css({left: -slider_w});
      }

      $slider_item.eq(curIndex).animate({left: 0});
    };
  };

  $.fn.tab = function () {
    var $tabBtn_wrapper = this.find('.tab-title');
    var $tab_btn = $tabBtn_wrapper.find('a');
    var $tab_cont = this.find('.tab-cont__item');
    var $tab_wrapper = $tab_cont.parent();

    var week_default = ['最新', '一', '二', '三', '四', '五', '六', '日'];
    var week_arr = ['最新', '周一', '周二', '周三', '周四', '周五', '周六', '周日'];


    $tab_btn.click(function () {
      var index = $(this).index();

      $tab_btn.removeClass('cur');  
      $(this).addClass('cur');

      if ($tab_wrapper.hasClass('tab-cont')) {
        $tab_wrapper.animate({marginLeft: -index * 260});
      } else {
        $tab_cont.removeClass('tab-cont__cur');
        $tab_cont.eq(index).addClass('tab-cont__cur');
      }

      if ($tabBtn_wrapper.hasClass('week-tab')) {
        $tab_btn.each(function (i) {
          $(this).text(week_default[i]);
        });

        $(this).text(week_arr[index]);
      }

      return false;
    });
  };

  $.fn.backTop = function () {
    var $elem = this;
    var $doc = $(document.body);
    var client_h = $(window).height();

    $elem.click(function () {
      $doc.animate({scrollTop: 0});
    });
  }

})(window.jQuery, window, document);