@extends('admin/layouts.backend')
@section('title', 'Academic List')
@section('content')
<div class="row">
	<div class="col-md-12 grid-margin">
	  <div class="d-flex justify-content-between flex-wrap">
	  <div class="d-flex align-items-end flex-wrap justify-content-between w-100">
		  <div class="me-md-3 me-xl-5">
			<h2>Academic List</h2>
		  </div>
		  <div class="d-flex">
			<i class="mdi mdi-home text-muted hover-cursor"></i>
			<p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;Dashboard&nbsp;/&nbsp;</p>
			<p class="text-primary mb-0 hover-cursor">Academic List</p>
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
				  <th>Title</th>
				  <th>Question</th>				  
				  <th>Answer</th>				  
				  <th>Created At</th>
				</tr>
			  </thead>
			  <tbody>
				@if(isset($Usersacademic))
					@php
						$i=1;
					@endphp
					@foreach($Usersacademic as $list)
						<tr class="table-info">
						  <td>{{ $i }}</td>
						  <td>{{ $list->mood_name }}</td>
						  <td>{{ $list->sub_mood_name }}</td>
						  <td>{{ $list->title }}</td>
						  <td>{!! $list->question_id !!}</td>
						  <td>{!! $list->ans !!}</td>					
						  <td>{{ $list->created_at }}</td>
						  
						</tr>
					@php
						$i++;
					@endphp
					@endforeach
				@endif
			  </tbody>
			</table>
			<script>
				function validateDelete(){ 
					var confirms = confirm('Do you want to delete ?.');
					if(confirms==false){
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
