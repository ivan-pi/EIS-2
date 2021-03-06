MODULE eis_core_functions_mod

  USE, INTRINSIC :: ISO_C_BINDING
  USE eis_header
  USE eis_parser_constants
  USE eis_algorithm
  IMPLICIT NONE

  CONTAINS

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> A dummy function that signals an error if ever called
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_dummy(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C)
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = 0.0_eis_num
    errcode = eis_err_bad_value

  END FUNCTION eis_dummy

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Unary plus
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_uplus(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = params(1)
  END FUNCTION eis_uplus

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Unary minus
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_uminus(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = -params(1) 
  END FUNCTION eis_uminus

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Binary plus
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_bplus(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = params(1) + params(2)
  END FUNCTION eis_bplus

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Binary plus
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_bminus(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = params(1) - params(2)
  END FUNCTION eis_bminus

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> multiply
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_times(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = params(1) * params(2)
  END FUNCTION eis_times

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> divide
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_divide(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = params(1) / (SIGN(1.0_eis_num, params(2)) &
        * MAX(ABS(params(2)), eis_tiny))
  END FUNCTION eis_divide

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Raise to power
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_pow(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = params(1) ** params(2)
  END FUNCTION eis_pow

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Exponentiation
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_expo(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = params(1) * 10.0_eis_num ** params(2)
  END FUNCTION eis_expo

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Less than
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_lt(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = 0.0_eis_num
    IF (params(1) < params(2)) res = 1.0_eis_num

  END FUNCTION eis_lt

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Less than or equal to
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_le(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = 0.0_eis_num
    IF (params(1) <= params(2)) res = 1.0_eis_num
  
  END FUNCTION eis_le

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Greater than
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_gt(nparams, params, host_params, status_code, errcode)&
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = 0.0_eis_num
    IF (params(1) > params(2)) res = 1.0_eis_num

  END FUNCTION eis_gt

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Greater than or equal to
  !> @param[in] nparams
  !> @param[in] params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_ge(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = 0.0_eis_num
    IF (params(1) >= params(2)) res = 1.0_eis_num

  END FUNCTION eis_ge

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Equal to
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_eq(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = 0.0_eis_num
    IF (ABS(params(1) - params(2)) < eis_tiny) res = 1.0_eis_num

  END FUNCTION eis_eq

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Not equal to
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_neq(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = 0.0_eis_num
    IF (ABS(params(1) - params(2)) > eis_tiny) res = 1.0_eis_num

  END FUNCTION eis_neq

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> And
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_and(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = 0.0_eis_num
    IF (ABS(params(1)) > eis_tiny .AND. ABS(params(2)) > eis_tiny) &
        res = 1.0_eis_num

  END FUNCTION eis_and

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Or
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_or(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = 0.0_eis_num
    IF (ABS(params(1)) > eis_tiny .OR. ABS(params(2)) > eis_tiny) &
        res = 1.0_eis_num

  END FUNCTION eis_or

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Absolute value
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_abs(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = ABS(params(1))

  END FUNCTION eis_abs

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Integer by flooring
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_floor(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = FLOOR(params(1))

  END FUNCTION eis_floor

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Integer by ceiling
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_ceil(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = CEILING(params(1))

  END FUNCTION eis_ceil

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Integer by ceiling
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_nint(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = NINT(params(1))

  END FUNCTION eis_nint

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Integer by truncation
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_aint(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = AINT(params(1))

  END FUNCTION eis_aint

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Square root
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_sqrt(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    IF (params(1) > 0.0_eis_num) THEN
      res = SQRT(params(1))
    ELSE
      res = 1.0_eis_num
      errcode = IOR(errcode, eis_err_maths_domain)
    END IF

  END FUNCTION eis_sqrt

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Sine
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_sin(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = SIN(params(1))

  END FUNCTION eis_sin

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Cosine
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_cos(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = COS(params(1))

  END FUNCTION eis_cos

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Tangent
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_tan(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = TAN(params(1))

  END FUNCTION eis_tan

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Arcsine
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_asin(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    IF (ABS(params(1)) <= 1.0_eis_num) THEN
      res = ASIN(params(1))
    ELSE
      res = 1.0_eis_num
      errcode = IOR(errcode, eis_err_maths_domain)
    END IF

  END FUNCTION eis_asin

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Arccosine
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_acos(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    IF (ABS(params(1)) <= 1.0_eis_num) THEN
      res = ACOS(params(1))
    ELSE
      res = 1.0_eis_num
      errcode = IOR(errcode, eis_err_maths_domain)
    END IF

  END FUNCTION eis_acos

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Arctangent
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_atan(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = ATAN(params(1))

  END FUNCTION eis_atan

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Two parameter arctangent
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_atan2(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = ATAN2(params(1), params(2))

  END FUNCTION eis_atan2

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Hyperbolic sine
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_sinh(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = SINH(params(1))

  END FUNCTION eis_sinh

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Hyperbolic cosine
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_cosh(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = COSH(params(1))

  END FUNCTION eis_cosh

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Hyperbolic tangent
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_tanh(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = TANH(params(1))

  END FUNCTION eis_tanh

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> E to the power of
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_exp(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = EXP(params(1))

  END FUNCTION eis_exp

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Natural logarithm
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_loge(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    IF (params(1) > 0.0_eis_num) THEN
      res = LOG(params(1))
    ELSE
      res = 1.0_eis_num
      errcode = IOR(errcode, eis_err_maths_domain)
    END IF

  END FUNCTION eis_loge

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Logarithm base 10
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_log10(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    IF (params(1) > 0.0_eis_num) THEN
      res = LOG10(params(1))
    ELSE
      res = 1.0_eis_num
      errcode = IOR(errcode, eis_err_maths_domain)
    END IF

  END FUNCTION eis_log10

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Logarithm to arbitrary base
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_log_base(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    IF (params(1) > 0.0_eis_num .AND. params(2) > 0.0_eis_num) THEN
      res = LOG(params(1))/LOG(params(2))
    ELSE
      res = 1.0_eis_num
      errcode = IOR(errcode, eis_err_maths_domain)
    END IF

  END FUNCTION eis_log_base

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Gaussian function
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_gauss(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    IF (ABS(params(3)) > 0.0_eis_num) THEN
      res = EXP(-((params(1)-params(2))/params(3))**2)
    ELSE
      res = 1.0_eis_num
      errcode = IOR(errcode, eis_err_maths_domain)
    END IF

  END FUNCTION eis_gauss

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Semi-Gaussian function. Gaussian that rises to a fixed plateau
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_semigauss(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res, t0

    IF (params(3) > 0.0_eis_num .AND. ABS(params(2)) > 0.0_eis_num &
        .AND. params(2) > 0.0_eis_num) THEN
      t0 = params(4) * SQRT(-LOG(params(3)/params(2)))
      IF (params(1) <= t0) THEN
        res = params(2) * EXP(-((params(1)-t0)/params(4))**2)
      ELSE
        res = params(2)
      END IF
    ELSE
      res = 1.0_eis_num
      errcode = IOR(errcode, eis_err_maths_domain)
    END IF

  END FUNCTION eis_semigauss

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Super-Gaussian function. Gaussian with a power greater than 2
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_supergauss(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    IF (ABS(params(3)) > 0.0_eis_num) THEN
      res = EXP(-((params(1)-params(2))/params(3))**NINT(params(4)))
    ELSE
      res = 1.0_eis_num
      errcode = IOR(errcode, eis_err_maths_domain)
    END IF

  END FUNCTION eis_supergauss

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Inverse hyperbolic sine
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_asinh(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

#ifdef F2008
    res = ASINH(params(1))
#else
    res = params(1)**2 + 1.0_eis_num
    IF (res < 0.0_eis_num) THEN
      errcode = IOR(errcode, eis_err_maths_domain)
      RETURN
    END IF
    res = params(1) + SQRT(res)
    IF (res <= 0.0_eis_num) THEN
      errcode = IOR(errcode, eis_err_maths_domain)
      RETURN
    END IF
    res = LOG(res)
#endif

  END FUNCTION eis_asinh

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Inverse hyperbolic cosine
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_acosh(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

#ifdef F2008
    res = ACOSH(params(1))
#else
    res = params(1)**2 - 1.0_eis_num
    IF (res < 0.0_eis_num) THEN
      errcode = IOR(errcode, eis_err_maths_domain)
      RETURN
    END IF
    res = params(1) + SQRT(res)
    IF (res <= 0.0_eis_num) THEN
      errcode = IOR(errcode, eis_err_maths_domain)
      RETURN
    END IF
    res = LOG(res)
#endif

  END FUNCTION eis_acosh

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Inverse hyperbolic tangent
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_atanh(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

#ifdef F2008
    res = ATANH(params(1))
#else
    res = 1.0_eis_num - params(1)
    IF (ABS(res) < eis_tiny) THEN
      errcode = IOR(errcode, eis_err_maths_domain)
      RETURN
    END IF
    res = (1.0_eis_num + params(1)) / res
    IF (res <= 0.0_eis_num) THEN
      errcode = IOR(errcode, eis_err_maths_domain)
      RETURN
    END IF
    res = 0.5_eis_num * LOG(res)
#endif

  END FUNCTION eis_atanh

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> If condition is true return first value, if not return second
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_if(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    IF (ABS(params(1)) > eis_tiny) THEN
      res = params(2)
    ELSE
      res = params(3)
    END IF

  END FUNCTION eis_if

  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Interpolate through a set of control points
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_interpol(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C)
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res
    INTEGER :: n_items, i
    REAL(eis_num), DIMENSION(:), ALLOCATABLE :: x, y

    IF (MOD(nparams,2) == 0) THEN
      !EPOCH style interpolate
      n_items = (nparams-2)/2
      IF (n_items /= NINT(params(nparams))) THEN
        res = 0
        errcode = eis_err_wrong_parameters
        RETURN
      END IF
    ELSE
      !EIS style interpolate
      n_items = (nparams-1)/2
    END IF
    ALLOCATE(x(n_items), y(n_items))
    DO i = 1, n_items
      x(i) = params(i*2)
      y(i) = params(i*2+1)
    END DO
    res = eis_interpolate1d(params(1), x, y, errcode)

  END FUNCTION eis_interpol

#ifdef F2008
  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Bessel function of the first kind
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_bessel_j(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C)
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    IF (params(1) < 0.0_eis_num) THEN
      errcode = IOR(errcode, eis_err_maths_domain)
      RETURN
    END IF

    res = BESSEL_JN(NINT(params(1), INT64), params(2))

  END FUNCTION eis_bessel_j
#endif

#ifdef F2008
  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Bessel function of the second kind
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_bessel_y(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C) 
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    IF (params(1) < 0.0_eis_num) THEN
      errcode = IOR(errcode, eis_err_maths_domain)
      RETURN
    END IF

    res = BESSEL_YN(NINT(params(1), INT64), params(2))

  END FUNCTION eis_bessel_y
#endif

#ifdef F2008
  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Error function
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_erf(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C)
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = ERF(params(1))

  END FUNCTION eis_erf
#endif

#ifdef F2008
  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Complementary error function
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_erfc(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C)
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = ERFC(params(1))

  END FUNCTION eis_erfc
#endif

#ifdef F2008
  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Exponentially scaled complementary error function
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_erfc_scaled(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C)
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams      
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    res = ERFC_SCALED(params(1))

  END FUNCTION eis_erfc_scaled
#endif

#ifdef F2008
  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Bernoulli gamma function
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_gamma_fn(nparams, params, host_params, status_code, errcode) &
      RESULT(res) BIND(C)
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    IF (params(1) <= 0.0_eis_num) THEN
      errcode = IOR(errcode, eis_err_maths_domain)
      RETURN
    END IF

    res = GAMMA(params(1))

  END FUNCTION eis_gamma_fn
#endif

#ifdef F2008
  !> @author C.S.Brady@warwick.ac.uk
  !> @brief
  !> Log of Bernoulli gamma function
  !> @param[in] nparams
  !> @param[in] params
  !> @param[in] host_params
  !> @param[inout] status_code
  !> @param[inout] errcode
  FUNCTION eis_log_gamma_fn(nparams, params, host_params, status_code, &
      errcode) RESULT(res) BIND(C)
    INTEGER(eis_i4), VALUE, INTENT(IN) :: nparams
    REAL(eis_num), DIMENSION(nparams), INTENT(IN) :: params
    TYPE(C_PTR), VALUE, INTENT(IN) :: host_params
    INTEGER(eis_status), INTENT(INOUT) :: status_code
    INTEGER(eis_error), INTENT(INOUT) :: errcode
    REAL(eis_num) :: res

    IF (params(1) <= 0.0_eis_num) THEN
      errcode = IOR(errcode, eis_err_maths_domain)
      RETURN
    END IF

    res = LOG_GAMMA(params(1))

  END FUNCTION eis_log_gamma_fn
#endif

END MODULE eis_core_functions_mod
