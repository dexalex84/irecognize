###
# DISABLE submit button which wasnt pushed
  jQuery.rails.disableFormElements = (form) ->
    submittedBy = form.data('ujs:submit-button')?.name
    form.find(jQuery.rails.disableSelector).each ->
      element = $(this)
      element.prop('disabled', true)
      element[method](element.data('disable-with'))
      if submittedBy && element.attr('name') == submittedBy
        method = if element.is('button') then 'html' else 'val'
        element.data('ujs:enable-with', element[method]())
###