$(function () {
  defaultTimes = $("#default_times")
  startsAt = defaultTimes.data("startsAt")
  endsAt = defaultTimes.data("endsAt")
  if(defaultTimes.length == 1 && startsAt != null){
    defaultStartDate = startsAt.slice(1,-11)
    if (endsAt != null){
      defaultEndDate = endsAt.slice(1,-11)
    }else {
      defaultEndDate = null
    }
  }else {
    defaultStartDate = moment().startOf('hour').add(4,'h');
    defaultEndDate = moment().startOf('hour').add(5,'h');
  }

  iconSet = {
    time: 'fa fa-time',
    date: 'fa fa-calendar',
    up: 'fa fa-chevron-up',
    down: 'fa fa-chevron-down',
    previous: 'fa fa-chevron-left',
    next: 'fa fa-chevron-right',
    today: 'fa fa-screenshot',
    clear: 'fa fa-trash',
    close: 'fa fa-remove'
  }

  if ($('#event_starts_at').length == 1){
    $('#event_starts_at').datetimepicker({
      sideBySide: true,
      icons: iconSet
    });

    $('#event_starts_at').data("DateTimePicker").date(moment(defaultStartDate));
  }

  if ($('#event_end_at').length == 1){
    $('#event_ends_at').datetimepicker({
      sideBySide: true,
      icons: iconSet
    });

    $('#event_ends_at').data("DateTimePicker").date(moment(defaultEndDate));
  }

});

