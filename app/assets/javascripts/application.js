// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui/sortable
//= require turbolinks
//= require classie
//= require moment
//= require fastclick
//= require foundation

// Angular Directives
//= require angular
//= require angular-cookie
//= require angular-resource
//= require angular-sanitize
//= require angular-ui-router
//= require angular-touch
//= require angular-animate
//= require ng-underscore/build/ng-underscore.js
//= require angular-foundation/mm-foundation-tpls
//= require angular-ui-sortable/sortable
//= require dataTables/jquery.dataTables
//= require datatables-plugins/integration/foundation/dataTables.foundation
//= require responsive-tables/responsive-tables
//= require ng-s3upload
//= require angular-chartjs-directive

// Vendor assets
//= require jquery-icheck/icheck
//= require select2/select2
//= require selectfx.js/dist/js/selectfx
//= require sweetalert
//= require nouislider

// DEPRECATED

// Charts
//  require flot
//  require flot/jquery.flot.pie
//  require flot/jquery.flot.resize
//  require flot.tooltip
//  require Chart


//= require bootstrap-touchspin/dist/jquery.bootstrap-touchspin

// Our Angular app files
//= require angular/salubrity

//= require_tree ./

$(function() {
  $(document).foundation({
    equalizer : {
      // Specify if Equalizer should make elements equal height once they become stacked.
      equalize_on_stack: true
    }
  });
})

// DataTables Default Options
var dTableOptions = {
  scrollX: true,
  scrollY: "500px",
  scrollCollapse: true,
  autoWidth: false,
  pageLength: 50,
  lengthMenu: [ [50, 100, 150, -1], [50, 100, 150, "All"] ],
  stateSave: true,
  order: [ 1, 'desc' ],
  columnDefs: [
    { "orderable": false, "targets": 0 }
  ],
  "tableTools": {
    "aButtons": [
      {
          "sExtends": "print",
          "bShowAll": false
      }
    ]
  }
};