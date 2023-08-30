@extends('layouts.app')

<style>
    .login-body {
        height: 100vh;
        background-image: radial-gradient(#3037f0 2.5px, transparent 2.5px);
        background-size: 67px 67px;
        background-color: #071952;
        width: 100%;
        display: grid;
        place-content: center;
    }

    .navbar {
        display: none !important;
    }

    .card {
        width: 550px;
        padding: 20px;
        border-radius: 25px;
    }

    .card-header {
        border-bottom: 0px !important;
        background-color: #fff !important;
    }


    .card-header img {
        height: 70%;
    }

    .card-header  h3 {
        font-size: 23px;
        font-weight: 600;
    }
    .logo-img img {
        width: 80px;
    }
</style>

@section('content')
<div class="login-body">

    <div class="place-center ">
        <div class="row ">
            <div class="">
                <div class="card">

                    <!-- <div class="card-header">{{ __('Login') }}</div> -->
                    <div class="card-header d-flex justify-content-center flex-column align-items-center">
                        <div class="logo-img">
                            <img src="{{ asset('public/backend/image/logo.jpeg') }}" alt="logo" />
                        </div>
                        <div class="mt-4">
                            <h3>LOGIN</h3>
                        </div>
                    </div>
                    <div class="card-body">
                        <form method="POST" action="{{ route('login') }}">
                            @csrf

                            <div class="row mb-3">
                                <label for="email" class="col-md-12 col-form-label text-md-end">{{ __('Email Address') }}</label>

                                <div class="col-md-12">
                                    <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>

                                    @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="password" class="col-md-12 col-form-label text-md-end">{{ __('Password') }}</label>

                                <div class="col-md-12">
                                    <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="current-password">

                                    @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-12 ">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>

                                        <label class="form-check-label" for="remember">
                                            {{ __('Remember Me') }}
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-0 mt-4">
                                <div class=" ">
                                    <button type="submit" class="btn btn-primary">
                                        {{ __('Login') }}
                                    </button>

                                    @if (Route::has('password.request'))
                                    <a class="btn btn-link" href="{{ route('password.request') }}">
                                        {{ __('Forgot Your Password?') }}
                                    </a>
                                    @endif
                                </div>
                            </div>
                            <div class="row mt-4 ">
                                <a href="{{ route('register') }}" class="text-right">New User? Register Here</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
@endsection