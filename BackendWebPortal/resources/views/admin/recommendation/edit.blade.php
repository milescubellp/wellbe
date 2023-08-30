@extends('admin/layouts.backend')
@section('title', 'Edit Recommendation')
@section('content')

<div class="row">
	<div class="col-md-12 grid-margin">
	  <div class="d-flex justify-content-between flex-wrap">
	  <div class="d-flex align-items-end flex-wrap justify-content-between w-100">
		  <div class="me-md-3 me-xl-5">
			<h2>Edit Recommendation</h2>
		  </div>
		  <div class="d-flex">
			<i class="mdi mdi-home text-muted hover-cursor"></i>
			<p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;Dashboard&nbsp;/&nbsp;</p>
			<p class="text-primary mb-0 hover-cursor">Edit Recommendation</p>
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
			<form role="form" action="{{ asset('admin/edit_recommendation_action') }}" method="POST" enctype='multipart/form-data'>
			@CSRF
			<input type="hidden" name="id" value="{{ $moodRecommendationInfo->id }}">
			<div class="row">
				<div class="form-group col-6">					
					<label for="exampleInputEmail1">Moods <span style="color:red;">*</span></label>
					<select name="mood_id" class="form-control @error('mood_id') is-invalid @enderror" required>
						<option value="" >-Select-</option>
						@if(isset($Moods))
							@foreach($Moods as $list)
								<option value="{{ $list->id }}" @if($moodRecommendationInfo->mood_id == $list->id) {{ 'Selected' }} @endif >{{ $list->name }}</option>
							@endforeach
						@endif
					</select>
					@error('mood_id')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror					
				</div>
				
				<div class="form-group col-6">					
					<label for="exampleInputEmail1">Sub Moods <span style="color:red;">*</span></label>
					<select name="sub_mood_id" class="form-control @error('sub_mood_id') is-invalid @enderror" required>
						<option value="" >-Select-</option>
						@if(isset($MoodSub))
							@foreach($MoodSub as $list)
								<option value="{{ $list->id }}" @if($moodRecommendationInfo->sub_mood_id == $list->id) {{ 'Selected' }} @endif >{{ $list->sub_mood_name }}</option>
							@endforeach
						@endif
					</select>
					@error('sub_mood_id')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror					
				</div>
				
				{{-- <div class="form-group col-6">					
					<label for="exampleInputEmail1">Type <span style="color:red;">*</span></label>
					<select name="type" class="form-control @error('type') is-invalid @enderror" required>
						<option value="Video" @if($moodRecommendationInfo->type == 'Video') {{ 'Selected' }} @endif >Video</option>
						<option value="Audio" @if($moodRecommendationInfo->type == 'Audio') {{ 'Selected' }} @endif >Audio</option>
					</select>
					@error('type')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror					
				</div> --}}
				
				<div class="form-group col-12">
					<label for="exampleInputEmail1">Description <span style="color:red;">*</span></label>
					<textarea name="description" id="description" rows="5" class="form-control ckeditor @error('description') is-invalid @enderror" id="exampleInputEmail1" placeholder="Description" required>{{ $moodRecommendationInfo->description }}</textarea>
					<h5 id="maxContentPost" style="text-align:right"></h5>
					@error('description')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>	
			</div>
			
			<button type="submit" class="btn btn-primary me-2">Submit</button>
		  </form>
		</div>
	  </div>
	</div>
</div>

@endsection