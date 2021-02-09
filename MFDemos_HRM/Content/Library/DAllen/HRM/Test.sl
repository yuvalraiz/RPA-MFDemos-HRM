namespace: DAllen.HRM
flow:
  name: Test
  inputs:
    - FirstStep
  workflow:
    - is_true:
        do:
          io.cloudslang.base.utils.is_true:
            - bool_value: '${str(FirstStep=="allen")}'
        publish:
          - Msg: output_2
        navigate:
          - 'TRUE': ok_message
          - 'FALSE': ok_message_1
    - ok_message:
        do:
          io.cloudslang.base.utils.do_nothing: []
        publish:
          - Msg: This is allen playing with rpa
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
    - ok_message_1:
        do:
          io.cloudslang.base.utils.do_nothing:
            - user_input: '${FirstStep}'
        publish:
          - Msg: '${user_input+" is not allen"}'
        navigate:
          - SUCCESS: CUSTOM
          - FAILURE: on_failure
  outputs:
    - my_first_message_1: '${Msg}'
  results:
    - SUCCESS
    - CUSTOM
    - FAILURE
extensions:
  graph:
    steps:
      is_true:
        x: 159
        'y': 145
      ok_message:
        x: 276
        'y': 17
        navigate:
          677cbb3b-a3ea-459e-d954-e133e3f821ff:
            targetId: 87388537-b40d-9df7-4687-8ff6528be027
            port: SUCCESS
      ok_message_1:
        x: 306
        'y': 210
        navigate:
          69db1ab3-5190-5abe-b2b4-f1e47030e3bd:
            targetId: d662682c-292d-3fb9-e8e1-361ac76943ae
            port: SUCCESS
    results:
      SUCCESS:
        87388537-b40d-9df7-4687-8ff6528be027:
          x: 488
          'y': 114
      CUSTOM:
        d662682c-292d-3fb9-e8e1-361ac76943ae:
          x: 492
          'y': 237
