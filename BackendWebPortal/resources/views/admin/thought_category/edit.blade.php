@extends('admin/layouts.backend')
@section('title', 'Edit Thought Category')
@section('content')

<div class="row">
	<div class="col-md-12 grid-margin">
	  <div class="d-flex justify-content-between flex-wrap">
	  <div class="d-flex align-items-end flex-wrap justify-content-between w-100">
		  <div class="me-md-3 me-xl-5">
			<h2>Edit Thought Category</h2>
		  </div>
		  <div class="d-flex">
			<i class="mdi mdi-home text-muted hover-cursor"></i>
			<p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;Dashboard&nbsp;/&nbsp;</p>
			<p class="text-primary mb-0 hover-cursor">Edit Thought Category</p>
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
			<form role="form" action="{{ asset('admin/edit_thought_category_action') }}" method="POST" enctype='multipart/form-data'>
			@CSRF
			<input type="hidden" name="id" value="{{ $ThoughtcategoryInfo->id }}">
			<div class="row">

				<div class="form-group col-6">
					<label for="exampleInputEmail1">Title <span style="color:red;">*</span></label>
					<input type="text" name="title" class="form-control @error('title') is-invalid @enderror" id="exampleInputEmail1" placeholder="title" value="{{ $ThoughtcategoryInfo->title }}" required>
					@error('title')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>				

                <div class="form-group col-12">
					<label for="exampleInputEmail1">Description <span style="color:red;">*</span></label>
					<textarea name="description" id="description" rows="5" class="form-control ckeditor @error('description') is-invalid @enderror"  placeholder="Description" required>{{ $ThoughtcategoryInfo->description }}</textarea>
					@error('description')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>
				
				<div class="form-group col-6">
					<label for="exampleInputEmail1">{{ __('Image') }} <span style="color:red;">*</span></label>
					<input id="files" type="file" class="form-control @error('image') is-invalid @enderror" name="image" >
					@error('image')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
                    <img src="{{ asset('public/uploads/thought/') }}/{{ $ThoughtcategoryInfo->image }}" height="60">
				</div>	

			</div>
			
			<button type="submit" class="btn btn-primary me-2">Save & Change</button>
		  </form>
		</div>
	  </div>
	</div>
</div>

@endsection