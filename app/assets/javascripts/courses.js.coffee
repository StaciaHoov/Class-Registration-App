
jQuery ->
    $('#all_courses').dataTable();
    
    $('#tiny_courses').dataTable({
        paging: false,
        searching: false
    });
    $('#small_courses').dataTable({
        paging: false,
        searching: false
    });
    $('#medium_courses').dataTable({
        paging: false,
        searching: false
    });
    $('#big_courses').dataTable({
        paging: false,
        searching: false
    });
    $('#adult_courses').dataTable({
        paging: false,
        searching: false
    });
    $('.best_in_place').best_in_place()
    
