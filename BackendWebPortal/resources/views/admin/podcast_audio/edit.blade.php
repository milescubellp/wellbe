@extends('admin/layouts.backend')
@section('title', 'Edit podcast Audio')
@section('content')

<div class="row">
	<div class="col-md-12 grid-margin">
	  <div class="d-flex justify-content-between flex-wrap">
	  <div class="d-flex align-items-end flex-wrap justify-content-between w-100">
		  <div class="me-md-3 me-xl-5">
			<h2>Edit podcast Audio</h2>
		  </div>
		  <div class="d-flex">
			<i class="mdi mdi-home text-muted hover-cursor"></i>
			<p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;Dashboard&nbsp;/&nbsp;</p>
			<p class="text-primary mb-0 hover-cursor">Edit podcast Audio</p>
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
			<form role="form" action="{{ asset('admin/edit_podcast_audio_action') }}" method="POST" enctype='multipart/form-data'>
			@CSRF
			<input type="hidden" name="id" value="{{ $PodcastaudioInfo->id }}">
			<div class="row">

                <div class="form-group col-6">					
					<label for="exampleInputEmail1">Podcast <span style="color:red;">*</span></label>
					<select name="podcast_id" class="form-control @error('podcast_id') is-invalid @enderror" required>
						<option value="" >-Select-</option>
						@if(isset($Podcasts))
							@foreach($Podcasts as $list)
								<option value="{{ $list->id }}" @if($PodcastaudioInfo->podcast_id == $list->id) {{ 'Selected' }} @endif >{{ $list->title }}</option>
							@endforeach
						@endif
					</select>
					@error('podcast_id')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror					
				</div>

				<div class="form-group col-6">
					<label for="exampleInputEmail1">Title <span style="color:red;">*</span></label>
					<input type="text" name="title" class="form-control @error('title') is-invalid @enderror" id="exampleInputEmail1" placeholder="title" value="{{ $PodcastaudioInfo->title }}" required>
					@error('title')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>				

                <div class="form-group col-12">
					<label for="exampleInputEmail1">Description <span style="color:red;">*</span></label>
					<textarea name="description" id="description" rows="5" class="form-control ckeditor @error('description') is-invalid @enderror"  placeholder="Description" required>{{ $PodcastaudioInfo->description }}</textarea>
					@error('description')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>

                <input type="text" name="audio" id="audiovalue" value="{{ $PodcastaudioInfo->audio }}" >

                <div class="form-group col-6">
                    <a target="_blank" href="{{ asset('public/uploads/podcast/') }}/{{ $PodcastaudioInfo->audio }}" >Audio Link</a>
                    <button type="button" class="btn btn-primary upload-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
										<i class="mdi mdi-upload"></i> Add Video</button>
				</div>
			</div>
			
			<button type="submit" class="btn btn-primary me-2">Save & Change</button>
		  </form>
		</div>
	  </div>
	</div>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1	" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title " id="exampleModalLabel">Upload Reccomanded File</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body mt-2">
                <form id="fileUploadForm" method="POST" action="{{ asset('admin/upload_podcast_action') }}" enctype="multipart/form-data">
                    @csrf
                    
                    <div class="form-group mb-3">
                        <input name="audio" type="file" class="form-control">
                    </div>

                    <div class="form-group">
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-danger" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%"></div>
                        </div>
                    </div>

                    <div class="d-grid mb-3">
                        <input type="submit" value="Submit" class="btn btn-primary">
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.3.0/jquery.form.min.js"></script>
<script>
    $(function() {
        $(document).ready(function() {
            $('#fileUploadForm').ajaxForm({
                cache: false,
                beforeSend: function() {
                    var percentage = '0';
                },
                uploadProgress: function(event, position, total, percentComplete) {
                    var percentage = percentComplete;
                    $('.progress .progress-bar').css("width", percentage + '%', function() {
                        return $(this).attr("aria-valuenow", percentage) + "%";
                    })
                },
                success: function(res) {
                    if (res.success) {
                        alert('Add Successfully');
                        $("#audiovalue").val(res.file_name);                        

                        $("#fileUploadForm")[0].reset();
                        $(".modal .btn-close").click();
                        var percentage = '0';
                        $('.progress .progress-bar').css("width", percentage + '%', function() {
                            return $(this).attr("aria-valuenow", percentage) + "%";
                        });
                    }
                }
            });
        });
    });
</script>

@endsection