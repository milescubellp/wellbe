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
    .logo-img img {
        width: 80px;
    }
</style>
@section('content')
<div class="login-body">

    <div class="place-center">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <!-- <div class="card-header">{{ __('Register') }}</div> -->
                    <div class="card-header d-flex justify-content-center flex-column align-items-center">
                        <div class="logo-img">
                            <img src="{{ asset('public/backend/image/logo.jpeg') }}" alt="logo" />
                        </div>
                        <div class="mt-4">
                            <h3>Register</h3>
                        </div>
                    </div>

                    <div class="card-body">
                        <form method="POST" action="{{ route('register') }}">
                            @csrf

                            <div class="row mb-3">
                                <label for="name" class="col-md-12 col-form-label text-md-end">{{ __('Name') }}</label>

                                <div class="col-md-12">
                                    <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus>

                                    @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="email" class="col-md-12 col-form-label text-md-end">{{ __('Email Address') }}</label>

                                <div class="col-md-12">
                                    <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email">

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
                                    <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="new-password">

                                    @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="password-confirm" class="col-md-12 col-form-label text-md-end">{{ __('Confirm Password') }}</label>

                                <div class="col-md-12">
                                    <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password">
                                </div>
                            </div>

                            <div class="row mb-0">
                                <div class="col-md-12 ">
                                    <button type="submit" class="btn btn-primary">
                                        {{ __('Register') }}
                                    </button>
                                </div>
                            </div>
                            <div class="row mt-4 ">
                                <a href="{{ route('login') }}" class="text-right">Alredy User? login Here</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection