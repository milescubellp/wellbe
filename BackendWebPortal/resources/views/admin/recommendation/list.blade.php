@extends('admin/layouts.backend')
@section('title', 'Recommendation List')
@section('content')
@php
use App\Models\Audiovideo;
@endphp

<style>
	.tabel-div .col {
		padding: 0;
	}
	.tabel-div .col .p-2 {
		padding: 10px 20px !important;
		font-size: 14px;
	}

	.no-gutter {
		margin: 0;
	}
</style>

<div class="row">
	<div class="col-md-12 grid-margin">
		<div class="d-flex justify-content-between flex-wrap">
			<div class="d-flex align-items-end flex-wrap justify-content-between w-100">
				<div class="me-md-3 me-xl-5">
					<h2>Recommendation List</h2>
				</div>
				<div class="d-flex">
					<i class="mdi mdi-home text-muted hover-cursor"></i>
					<p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;Dashboard&nbsp;/&nbsp;</p>
					<p class="text-primary mb-0 hover-cursor">Recommendation List</p>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-lg-12 stretch-card">
		<div class="card">
			<div class="card-body">
				<div class="table-responsive pt-3">
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
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>#</th>
								<th>Mood</th>
								<th>Sub Mood</th>
								<th>View Audio/Video</th>
								<th>Add Audio/Video</th>
								<th>Description</th>
								<th>Created At</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							@if(isset($moodRecommendation))
							@php
							$i=1;
							@endphp
							@foreach($moodRecommendation as $list)
							<tr class="table-info">
								<td>{{ $i }}</td>
								<td>{{ $list->mood_name }}</td>
								<td>{{ $list->sub_mood_name }}</td>
								<td><button class="btn btn-primary upload-btn" data-bs-toggle="modal" data-bs-target="#myModal2">Audio/Video </button></td>
								<td>
									<button type="button" class="btn btn-primary upload-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
										<i class="mdi mdi-upload"></i> Add Video</button>
								</td>
								<td>{!! $list->description !!}</td>
								<td>{{ $list->created_at }}</td>
								<td>
									<a href="{{ url('/admin/mood/recommendation/edit') }}/{{ $list->id }}"><button type="button" class="btn btn-success">Edit</button></a>
									<a href="{{ url('/admin/mood/recommendation/delete') }}/{{ $list->id }}" onclick="return validateDelete(this);"><button type="button" class="btn btn-danger">Delete</button></a>
								</td>




								<!-- Modal Upload Audio Video -->
								<div class="modal fade" id="exampleModal" tabindex="-1	" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title " id="exampleModalLabel">Upload Reccomanded File</h5>
												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body mt-2">
												<form id="fileUploadForm" method="POST" action="{{ asset('admin/upload_recommendation_action') }}" enctype="multipart/form-data">
													@csrf
													<input type="hidden" name="recommendation_id" value="{{ $list->id }}">
													<div class="form-group mb-3">
														<label for="type">Type <span style="color:red;"></span></label>
														<select name="type" class="form-control" required>
															<option value="Video">Video</option>
															<option value="Audio">Audio</option>
														</select>
													</div>

													<div class="form-group mb-3">
														<label for="title">Title <span style="color:red;"></span></label>
														<input name="title" type="text" placeholder="Title" class="form-control">
													</div>
													<div class="form-group mb-3">
														<input name="audio_video" type="file" class="form-control">
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
														$('.alert-success').html('Add Successfully');

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

								<!-- Modal Audio Video List -->


								<!-- Modal two -->
								<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModal2Label" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title " id="exampleModalLabel2">Video List</h5>
												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body mt-2" style="">
												<div class="contnent">

													@php
													$videoList = Audiovideo::where('recommendation_id',$list->id)->where('type','Video')->get();
													@endphp
													

													<div class="tabel-div">
														<div class="row no-gutters">
															<div class="col">
																<div class="border p-2">Title </div>
															</div>
															<div class="col">
																<div class="border p-2">Link</div>
															</div>
															<div class="col">
																<div class="border p-2">Created At</div>
															</div>
															<div class="col">
																<div class="border p-2">Action</div>
															</div>
														</div>


														@if(isset($videoList))
															@foreach($videoList as $vlist)

															<div class="row">
																<div class="col">
																	<div class="border p-2">{{ $vlist->title }} </div>
																</div>
																<div class="col">
																	<div class="border p-2"><a target="_blank" href="{{ asset('public/uploads/recommendation') }}/{{ $vlist->link }}" > Link </a></div>
																</div>
																<div class="col">
																	<div class="border p-2">{{ $vlist->created_at }}</div>
																</div>
																<div class="col">
																	<div class="border p-2"><a href="{{ url('/admin/recommendation/file/delete') }}/{{ $vlist->id }}" onclick="return validateDelete2(this);"><button type="button" class="btn btn-danger">Delete</button></a></div>
																</div>
															</div>

															@endforeach
														@endif

													</div>


												</div>
											</div>


											<div class="modal-header">
												<h5 class="modal-title " id="exampleModalLabel2">Audio List</h5>
											</div>
											<div class="modal-body mt-2" style="">
												<div class="contnent">

													@php
													$audioList = Audiovideo::where('recommendation_id',$list->id)->where('type','Audio')->get();													
													@endphp
													

													<div class="tabel-div">
														<div class="row no-gutters">
															<div class="col">
																<div class="border p-2">Title </div>
															</div>
															<div class="col">
																<div class="border p-2">Link</div>
															</div>
															<div class="col">
																<div class="border p-2">Created At</div>
															</div>
															<div class="col">
																<div class="border p-2">Action</div>
															</div>
														</div>



														@if(isset($audioList))
															@foreach($audioList as $alist)

															<div class="row">
																<div class="col">
																	<div class="border p-2">{{ $alist->title }} </div>
																</div>
																<div class="col">
																	<div class="border p-2"><a target="_blank" href="{{ asset('public/uploads/recommendation') }}/{{ $alist->link }}" > Link </a> </div>
																</div>
																<div class="col">
																	<div class="border p-2">{{ $alist->created_at }}</div>
																</div>
																<div class="col">
																	<div class="border p-2"><a href="{{ url('/admin/recommendation/file/delete') }}/{{ $alist->id }}" onclick="return validateDelete2(this);"><button type="button" class="btn btn-danger">Delete</button></a></div>
																</div>
															</div>

															@endforeach
														@endif

														
													</div>


												</div>
											</div>




										</div>
									</div>
								</div>


							</tr>
							@php
							$i++;
							@endphp
							@endforeach
							@endif
						</tbody>
					</table>
					<script>
						function validateDelete() {
							var confirms = confirm('Do you want to delete ?.');
							if (confirms == false) {
								return false;
							}
						}
						function validateDelete2() {
							var confirms = confirm('Do you want to delete ?.');
							if (confirms == false) {
								return false;
							}
						}
					</script>
				</div>
			</div>
		</div>
	</div>
</div>

@endsection