@extends('admin/layouts.backend')
@section('title', 'Add podcast')
@section('content')

<div class="row">
	<div class="col-md-12 grid-margin">
	  <div class="d-flex justify-content-between flex-wrap">
	  <div class="d-flex align-items-end flex-wrap justify-content-between w-100">
		  <div class="me-md-3 me-xl-5">
			<h2>Add podcast</h2>
		  </div>
		  <div class="d-flex">
			<i class="mdi mdi-home text-muted hover-cursor"></i>
			<p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;Dashboard&nbsp;/&nbsp;</p>
			<p class="text-primary mb-0 hover-cursor">Add podcast</p>
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
			<form role="form" action="{{ asset('admin/add_podcast_action') }}" method="POST" enctype='multipart/form-data'>
			@CSRF
			<div class="row">
                <div class="form-group col-6">
                    <label for="exampleInputEmail1">Moods <span style="color:red;">*</span></label>
                    <select name="mood_id" class="form-control" required>
                        <option value="">-Select-</option>
                        @if(isset($Moods))
                        @foreach($Moods as $list)
                        <option value="{{ $list->id }}">{{ $list->name }}</option>
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
					<label for="exampleInputEmail1">Title <span style="color:red;">*</span></label>
					<input type="text" name="title" class="form-control @error('title') is-invalid @enderror" id="exampleInputEmail1" placeholder="title" value="{{ old('title') }}" required>
					@error('title')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>				

                <div class="form-group col-12">
					<label for="exampleInputEmail1">Description <span style="color:red;">*</span></label>
					<textarea name="description" id="description" rows="5" class="form-control ckeditor @error('description') is-invalid @enderror"  placeholder="Description" required>{{ old('description') }}</textarea>
					@error('description')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>
				
				<div class="form-group col-6">
					<label for="exampleInputEmail1">{{ __('Image') }} <span style="color:red;">*</span></label>
					<input id="files" type="file" class="form-control @error('image') is-invalid @enderror" name="image" required>
					@error('image')
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