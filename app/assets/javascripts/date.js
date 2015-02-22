
var chosen=[]
var dates = $("#date").datepicker({
    minDate: "0",
    maxDate: "+2Y",
    defaultDate: "+1w",
    dateFormat: 'mm/dd/yy',
    numberOfMonths: 1,
    beforeShowDay: function(date){
        var mmddyy=$.datepicker.formatDate(  'mm/dd/yy', date ),
            sameAs=$.inArray(mmddyy,chosen)
        console.log(mmddyy)
        if (sameAs>=0)
            return  [false, "nope","Same as "+(1+sameAs)]
        else
            return [true]
    }
});