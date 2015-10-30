function solve() {
  return function () {
    /* globals $ */
    $.fn.gallery = function (columns) {
    var $gallery = $(this);
    var columnsPerRow = columns || 4;

    var $galleryList = $gallery.children('.gallery-list');
    var $images = $galleryList.children('.image-container');
    var $selected = $gallery.children('.selected');
    var $currentImage = $selected.find('#current-image');
    var $previusImage = $selected.find('#previous-image');
    var $nextImage = $selected.find('#next-image');

    function getPreviusImg(target, dataInfo) {
        var currentIndex = +dataInfo;
        var previusIndex = 0;
        var previusSRC = '';
        if (currentIndex == 1) {
            previusIndex = $images.length;
        } else {
            previusIndex = currentIndex - 1;
        }
        var temp = $($images[previusIndex - 1]).children().attr('src');
        previusSRC = temp
        return temp;
    };

    function getNextImg(target, dataInfo) {
        var currentIndex = +dataInfo;
        var nextIndex = 0;
        var nextSRC = '';
        if (currentIndex == 12) {
            nextIndex = 1;
        } else {
            nextIndex = currentIndex + 1;
        }
        var temp = $($images[nextIndex - 1]).children().attr('src');
        nextSRC = temp;
        return temp;
    };

    $gallery.addClass('gallery');

    $selected.hide();

    $galleryList.on('click','img',function () {
        var $this = $(this);
        var target = $this;
        var dataInfo = target.attr('data-info');
        var imageSRC = target.attr('src');
        
        $currentImage.attr('src', imageSRC);

        var prevSRC = getPreviusImg(target, dataInfo);      
        $previusImage.attr('src', prevSRC);

        var nextSRC = getNextImg(target, dataInfo);
        $nextImage.attr('src', nextSRC);

        $galleryList.addClass('blurred')
        $('<div class="disabled-background"></div>').appendTo($galleryList);
        $selected.show();
    });
    
    $currentImage.on('click', function () {
        $galleryList.removeClass('blurred');
        $('.disabled-background').remove()
        $selected.hide();
    });

    $previusImage.on('click', function () {
        var $prev = $(this);
        var imageSRC = $prev.attr('src');
        var result = '';
        result = imageSRC[5];
        if (imageSRC[6] !== '.') {
            result += imageSRC[6];
        };
        result = +result;
        
        $currentImage.attr('src', imageSRC);

        var prevSRC = getPreviusImg($prev, result);
        $previusImage.attr('src', prevSRC);


        var nextSRC = getNextImg($prev, result);
        $nextImage.attr('src', nextSRC);
    });

    $nextImage.on('click', function () {
        var $next = $(this);
        var imageSRC = $next.attr('src');
        var result = '';
        result = imageSRC[5];
        if (imageSRC[6] !== '.') {
            result += imageSRC[6];
        };
        result = +result;

        $currentImage.attr('src', imageSRC);

        var prevSRC = getPreviusImg($next, result);
        $previusImage.attr('src', prevSRC);


        var nextSRC = getNextImg($next, result);
        $nextImage.attr('src', nextSRC);
    });

    for (var i = 0; i < $images.length; i++) {
        var currentItem = $($images[i]);
        if ((i % columnsPerRow) == 0) {
            currentItem.addClass('clearfix');
        }
    }
    };
  };
}

module.exports = solve;