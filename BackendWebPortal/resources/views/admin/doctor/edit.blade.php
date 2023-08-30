@extends('admin/layouts.backend')
@section('title', 'Edit Doctor')
@section('content')

<div class="row">
	<div class="col-md-12 grid-margin">
	  <div class="d-flex justify-content-between flex-wrap">
	  <div class="d-flex align-items-end flex-wrap justify-content-between w-100">
		  <div class="me-md-3 me-xl-5">
			<h2>Edit Doctor</h2>
		  </div>
		  <div class="d-flex">
			<i class="mdi mdi-home text-muted hover-cursor"></i>
			<p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;Dashboard&nbsp;/&nbsp;</p>
			<p class="text-primary mb-0 hover-cursor">Edit Doctor</p>
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
			<form role="form" action="{{ asset('admin/edit_doctor_action') }}" method="POST" enctype='multipart/form-data'>
			@CSRF
			<input type="hidden" name="id" value="{{ $consultdoctorsInfo->id }}">
			<div class="row">
				<div class="form-group col-6">
					<label for="exampleInputEmail1">Name <span style="color:red;">*</span></label>
					<input type="text" name="name" class="form-control @error('name') is-invalid @enderror" id="exampleInputEmail1" placeholder="Name" value="{{ $consultdoctorsInfo->name }}" required>
					@error('name')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>
				<div class="form-group col-6">
					<label for="exampleInputEmail1">Email <span style="color:red;">*</span></label>
					<input type="email" name="email" class="form-control @error('email') is-invalid @enderror" id="exampleInputEmail1" placeholder="email" value="{{ $consultdoctorsInfo->email }}" required>
					@error('email')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>
				
				<div class="form-group col-6">
					<label for="exampleInputEmail1">Mobile <span style="color:red;">*</span></label>
					<input type="text" name="mobile" class="form-control @error('mobile') is-invalid @enderror" id="exampleInputEmail1" placeholder="mobile" value="{{ $consultdoctorsInfo->mobile }}" required>
					@error('mobile')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>

                <div class="form-group col-6">
					<label for="exampleInputEmail1">Profession <span style="color:red;">*</span></label>
					<input type="text" name="profession" class="form-control @error('profession') is-invalid @enderror" id="exampleInputEmail1" placeholder="profession" value="{{ $consultdoctorsInfo->profession }}" required>
					@error('profession')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>

                <div class="form-group col-6">
					<label for="exampleInputEmail1">Experience <span style="color:red;">*</span></label>
					<input type="text" name="experience" class="form-control @error('experience') is-invalid @enderror" id="experience" placeholder="Experience" value="{{ $consultdoctorsInfo->experience }}" required>
					@error('experience')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>

                <div class="form-group col-6">
					<label for="exampleInputEmail1">Availability <span style="color:red;">*</span></label>
					<input type="text" name="availability" class="form-control @error('availability') is-invalid @enderror" id="availability" placeholder="Availability" value="{{ $consultdoctorsInfo->availability }}" required>
					@error('availability')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>

                <div class="form-group col-6">
					<label for="exampleInputEmail1">Expertise <span style="color:red;">*</span></label>
					<select name="expertise" id="expertise" class="form-control @error('expertise') is-invalid @enderror"  required>
                        <option value="Mind Mastery" @if(isset($consultdoctorsInfo->expertise) && ($consultdoctorsInfo->expertise == 'Mind Mastery')) {{ 'Selected' }} @endif >Mind Mastery</option>
                        <option value="Mental Proficiency" @if(isset($consultdoctorsInfo->expertise) && ($consultdoctorsInfo->expertise == 'Mental Proficiency')) {{ 'Selected' }} @endif >Mental Proficiency</option>
                        <option value="Behavioral Specialization" @if(isset($consultdoctorsInfo->expertise) && ($consultdoctorsInfo->expertise == 'Behavioral Specialization')) {{ 'Selected' }} @endif >Behavioral Specialization</option>
                    </select>
					@error('expertise')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>

                <div class="form-group col-6">
					<label for="exampleInputEmail1">Language <span style="color:red;">*</span></label>
					<select name="language" id="language" class="form-control @error('language') is-invalid @enderror"  required>
                        <option value="English" @if(isset($consultdoctorsInfo->language) && ($consultdoctorsInfo->language == 'English')) {{ 'Selected' }} @endif >English</option>
                        <option value="Hindi" @if(isset($consultdoctorsInfo->language) && ($consultdoctorsInfo->language == 'Hindi')) {{ 'Selected' }} @endif >Hindi</option>
                        <option value="Urdu" @if(isset($consultdoctorsInfo->language) && ($consultdoctorsInfo->language == 'Urdu')) {{ 'Selected' }} @endif >Urdu</option>
                    </select>
					@error('language')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>

                <div class="form-group col-6">
					<label for="exampleInputEmail1">Available type <span style="color:red;">*</span></label>
					<select name="available_type" id="available_type" class="form-control @error('available_type') is-invalid @enderror"  required>
                        <option value="Video Call" @if(isset($consultdoctorsInfo->available_type) && ($consultdoctorsInfo->available_type == 'Video Call')) {{ 'Selected' }} @endif >Video Call</option>
                        <option value="Audio Call" @if(isset($consultdoctorsInfo->available_type) && ($consultdoctorsInfo->available_type == 'Audio Call')) {{ 'Selected' }} @endif >Audio Call</option>
                        <option value="Chat" @if(isset($consultdoctorsInfo->available_type) && ($consultdoctorsInfo->available_type == 'Chat')) {{ 'Selected' }} @endif >Chat</option>
                    </select>
					@error('available_type')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>

                <div class="form-group col-6">
					<label for="exampleInputEmail1">Cusult Fee <span style="color:red;">*</span></label>
					<input type="text" name="conslt_fee" class="form-control @error('conslt_fee') is-invalid @enderror" id="conslt_fee" placeholder="Conslt fee" value="{{ $consultdoctorsInfo->conslt_fee }}" required>
					@error('conslt_fee')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>

                <div class="form-group col-12">
					<label for="exampleInputEmail1">About <span style="color:red;">*</span></label>
					<textarea name="about" id="about" rows="5" class="form-control ckeditor @error('about') is-invalid @enderror"  placeholder="About" required>{{ $consultdoctorsInfo->about }}</textarea>
					@error('about')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>
				
				<div class="form-group col-6">
					<label for="exampleInputEmail1">{{ __('Profile') }} <span style="color:red;">*</span></label>
					<input id="files" type="file" class="form-control @error('profile_pic') is-invalid @enderror" name="profile_pic" >
					@error('profile_pic')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
                    <img src="{{ asset('public/uploads/doctor/') }}/{{ $consultdoctorsInfo->profile_pic }}" height="60">
				</div>				
			</div>
			
			<button type="submit" class="btn btn-primary me-2">Save & Change</button>
		  </form>
		</div>
	  </div>
	</div>
</div>

@endsection