// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap
//= require cocoon
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require select2
//= require select2_locale_pt-BR
//= require_tree .

document.addEventListener("turbolinks:load", function(){
    if ($('#search_user')) {
        $('#search_user').select2({
            placeholder: 'nome ou o email (case sensitive)',
            theme: 'bootstrap',
            allowClear: true,
            minimumInputLength: 3,
            maximumSelectionLength: 5,
            dataType: 'json',
            ajax: {
                url: '/usersearch',
                delay: 250,
                data: function (search) {
                    return {
                        busca: search,
                    };
                },
                results: function(data) {
                    return {
                        results: $.map( data, function(user, i) {
                            return { id: user.id, text: user.nome +' ('+ user.email + ')'}
                        } )
                    }
                },
            }
        });
    }
    if ($('#search_plataform')) {
        $('#search_plataform').select2({
            placeholder: 'nome (case sensitive)',
            theme: 'bootstrap',
            allowClear: true,
            minimumInputLength: 3,
            dataType: 'json',
            ajax: {
                url: '/plataformsearch',
                delay: 250,
                data: function (search) {
                    return {
                        busca: search,
                    };
                },
                results: function(data) {
                    return {
                        results: $.map( data, function(plataform, i) {
                            return { id: plataform.id, text: plataform.nome}
                        } )
                    }
                },
            }
        });
    }

    if ($('#search_movie')) {
        $('#search_movie').select2({
            theme: 'bootstrap',
            placeholder: 'Ex.: spiderman 2008',
            allowClear: true,
            minimumInputLength: 3,
            dataType: 'json',
            ajax: {
                url: '/moviessearch',
                delay: 250,
                data: function (search) {

                    var search = search .split(/\s+/);
                    var string = "", int = ""
                    for (let s of search){
                        if(isNaN(s)){
                            string += s + ' '
                        }else{
                            if(s.length === 4)
                                int = s
                            else
                                string += s + ' '
                        }
                    }
                    return {
                        busca: string,
                        year: int
                    };
                },
                results: function(data) {
                    return {
                        results: $.map(data, function(movie, i) {
                                if(movie.Title){
                                return {
                                    id: movie.imdbID, text: movie.Title + " (" + movie.Year + ")"
                                }
                            }
                        } )
                    }
                },
            }
        });
    }
});