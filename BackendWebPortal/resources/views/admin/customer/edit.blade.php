@extends('admin/layouts.backend')
@section('title', 'Edit Customer')
@section('content')

<div class="row">
	<div class="col-md-12 grid-margin">
	  <div class="d-flex justify-content-between flex-wrap">
	  <div class="d-flex align-items-end flex-wrap justify-content-between w-100">
		  <div class="me-md-3 me-xl-5">
			<h2>Edit Customer</h2>
		  </div>
		  <div class="d-flex">
			<i class="mdi mdi-home text-muted hover-cursor"></i>
			<p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;Dashboard&nbsp;/&nbsp;</p>
			<p class="text-primary mb-0 hover-cursor">Edit Customer</p>
		  </div>
		</div>
	  </div>
	</div>
</div>

<div class="row">
	<div class="col-12 grid-margin stretch-card">
	  <div class="card">
		<div class="card-body">
			@if(session()->has('success'))
				<div class="alert alert-success">
				  <strong>Success!</strong> {{ session()->get('success') }}
				</div>
			@endif
			@if(session()->has('error'))
				<div class="alert alert-danger">
					<strong>Warning!</strong> {{ session()->get('error') }}
				</div>
			@endif
			<form role="form" action="{{ asset('admin/edit_customer_action') }}" method="POST" enctype='multipart/form-data'>
			@CSRF
			<input type="hidden" name="user_id" value="{{ $userInfo->id }}">
			<div class="row">
				<div class="form-group col-6">
					<label for="exampleInputEmail1">Name <span style="color:red;">*</span></label>
					<input type="text" name="name" class="form-control @error('name') is-invalid @enderror" id="exampleInputEmail1" placeholder="Name" value="{{ $userInfo->name }}" required>
					@error('name')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>
				<div class="form-group col-6">
					<label for="exampleInputEmail1">Email <span style="color:red;">*</span></label>
					<input type="email" name="email" class="form-control @error('email') is-invalid @enderror" id="exampleInputEmail1" placeholder="email" value="{{ $userInfo->email }}" required>
					@error('email')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>
				<div class="form-group col-6">
					<label for="exampleInputEmail1">Code <span style="color:red;">*</span></label>
					<input type="text" name="code" class="form-control @error('code') is-invalid @enderror" id="exampleInputEmail1" placeholder="code" value="{{ $userInfo->code }}" required>
					@error('code')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>
				<div class="form-group col-6">
					<label for="exampleInputEmail1">Mobile <span style="color:red;">*</span></label>
					<input type="text" name="mobile" class="form-control @error('mobile') is-invalid @enderror" id="exampleInputEmail1" placeholder="mobile" value="{{ $userInfo->mobile }}" required>
					@error('mobile')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>
				
								
				<div class="form-group col-6">
					<label for="exampleInputEmail1">{{ __('Profile') }} <span style="color:red;">*</span></label>
					<input id="files" type="file" class="form-control @error('profile_pic') is-invalid @enderror" name="profile_pic" required>
					@error('profile_pic')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
					<img src="{{ asset('public/uploads/customer/') }}/{{ $userInfo->profile_pic }}" height="60">
				</div>				
			</div>
			
			<button type="submit" class="btn btn-primary me-2">Submit</button>
		  </form>
		</div>
	  </div>
	</div>
</div>

@endsection