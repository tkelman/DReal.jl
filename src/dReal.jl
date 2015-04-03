module dReal


if VERSION >= v"0.4.0-dev"
  RTLD_LAZY =  Libdl.RTLD_LAZY
  RTLD_DEEPBIND = Libdl.RTLD_DEEPBIND
  RTLD_GLOBAL = Libdl.RTLD_GLOBAL
  compat_dlopen = Libdl.dlopen
else
  compat_dlopen = dlopen
end

try
  compat_dlopen("libprim.so", RTLD_LAZY|RTLD_DEEPBIND|RTLD_GLOBAL)
  compat_dlopen("libClp.so", RTLD_LAZY|RTLD_DEEPBIND|RTLD_GLOBAL)
  compat_dlopen("libibex.so", RTLD_LAZY|RTLD_DEEPBIND|RTLD_GLOBAL)
  compat_dlopen("libgflags.so", RTLD_LAZY|RTLD_DEEPBIND|RTLD_GLOBAL)
  compat_dlopen("libglog.so", RTLD_LAZY|RTLD_DEEPBIND|RTLD_GLOBAL)
  compat_dlopen("libcapd.so", RTLD_LAZY|RTLD_DEEPBIND|RTLD_GLOBAL)
catch
  error("Could not load required shared libraries")
end

export
  init_dreal!,
  set_logic!,
  logic

include("wrap_capi.jl")
include("medium.jl")

export
  qf_uf,         # Uninterpreted Functions
  qf_nra,        # Non-Linear Real Arithmetic
  qf_nra_ode,    # Non-Linear Real Arithmetic
  qf_bv,         # BitVectors
  qf_rdl,        # Real difference logics
  qf_idl,        # Integer difference logics
  qf_lra,        # Real linear arithmetic
  qf_lia,        # Integer linear arithmetic
  qf_ufidl,      # UF + IDL
  qf_uflra,      # UF + LRA
  qf_bool,       # Only booleans
  qf_ct        # Cost


end