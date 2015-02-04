(function() {
  "use strict";

  if (typeof LineUpChecker === "undefined") {
    window.LineUpChecker = {};
  }

  $.Checker = function (el) {
    this.$el = $(el);
    this.$el.find('select.school-name').on("change", this.displayTemplate.bind(this));
    this.template = _.template($('#template').html());
  };

  $.Checker.prototype.displayTemplate = function (event) {
    var id = $(event.currentTarget).val();
    var that = this;

    $.ajax({
      url: "/api/schools/" + id + "/players",
      success: function (players) {
        var html = that.template({ players: players });
        that.$el.find('.check-area').html(html);
        that.$el.find('form.checker').on("submit", that.check.bind(that));
      },
      error: function (resp) {
        console.log(resp)
      }
    });
  };

  $.Checker.prototype.check = function (event) {
    event.preventDefault();

    var info = $(event.currentTarget).serializeJSON()
    var badEvents = [];

    for (var e in info) {
      if (e === "WS") {

      } else if (!this.checkEvent(info[e])) {
        badEvents.push(e)
      }
    }

    if (badEvents.length === 0) {
      alert("looks good")
    } else {
      alert("bad events: " + badEvents.join(" "))
    }

    return false;
  };

  $.Checker.prototype.checkEvent = function (event) {
    var sumRank1 = event["1"].reduce(function (prev, curr) {
      return prev + curr;
    });
    var sumRank2 = event["2"].reduce(function (prev, curr) {
      return prev + curr;
    });

    return sumRank1 <= sumRank2;
  }

  $.fn.checkers = function () {
    return this.each(function () {
      new $.Checker(this);
    });
  }

}());
