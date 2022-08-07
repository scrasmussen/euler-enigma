lc=julia
file=p51.jl
julia_path=jl_mods/:${JULIA_LOAD_PATH}

all: build

build:
	JULIA_LOAD_PATH=${julia_path} $(lc) $(file)
