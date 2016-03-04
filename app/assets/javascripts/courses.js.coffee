
jQuery ->
    $('#all_courses').dataTable();
    
    $('#tiny_courses').dataTable({
        paging: false,
        searching: false,
        "scrollX": true
    });
    $('#small_courses').dataTable({
        paging: false,
        searching: false,
        "scrollX": true
    });
    $('#medium_courses').dataTable({
        paging: false,
        searching: false,
        "scrollX": true
    });
    $('#big_courses').dataTable({
        paging: false,
        searching: false,
        "scrollX": true
    });
    $('#adult_courses').dataTable({
        paging: false,
        searching: false,
        "scrollX": true
    });
    $('.best_in_place').best_in_place()
    
