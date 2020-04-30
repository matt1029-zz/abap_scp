class ZCL_SERVICE_TEST definition
  public
  create public .

public section.

  interfaces IF_HTTP_SERVICE_EXTENSION .
protected section.
private section.
ENDCLASS.



CLASS ZCL_SERVICE_TEST IMPLEMENTATION.


  method IF_HTTP_SERVICE_EXTENSION~HANDLE_REQUEST.
    if  1 = 1.
    endif.
  endmethod.
ENDCLASS.
