@extends('admin/layouts.backend')
@section('title', 'Doctor List')
@section('content')
<div class="row">
	<div class="col-md-12 grid-margin">
	  <div class="d-flex justify-content-between flex-wrap">
		<div class="d-flex align-items-end flex-wrap justify-content-between w-100">
		  <div class="me-md-3 me-xl-5">
			<h2>Doctor List</h2>
		  </div>
		  <div class="d-flex">
			<i class="mdi mdi-home text-muted hover-cursor"></i>
			<p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;Dashboard&nbsp;/&nbsp;</p>
			<p class="text-primary mb-0 hover-cursor">Doctor List</p>
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
			<table class="table table-bordered tabel-striped ">
			  <thead>
				<tr>
				  <th>#</th>
				  <th>Name</th>
				  <th>Email</th>
				  <th>Mobile</th>
                  <th>Conslt Fee</th>
				  <th>Profile</th>
				  <th>Created At</th>
				  <th>Action</th>
				</tr>
			  </thead>
			  <tbody>
				@if(isset($Consultdoctors))
					@php
						$i=1;
					@endphp
					@foreach($Consultdoctors as $list)
						<tr class="table-info">
						  <td>{{ $i }}</td>
						  <td>{{ $list->name }}</td>
						  <td>{{ $list->email }}</td>
						  <td>{{ $list->mobile }}</td>
                          <td>{{ $list->conslt_fee }}</td>
							@if(isset($list->profile_pic))
								<td> <img src="{{ asset('public/uploads/doctor/') }}/{{ $list->profile_pic }}" height="70"></td>
							@else
								<td>No Image</td>
							@endif
						  
						  <td>{{ $list->created_at }}</td>
						  <td class="btns-grp">
							<a href="{{ url('/admin/doctor/edit') }}/{{ $list->id }}"><button type="button" class="btn btn-success">Edit</button></a>
							<a href="{{ url('/admin/doctor/delete') }}/{{ $list->id }}" onclick="return validateDelete(this);"><button type="button" class="btn btn-danger">Delete</button></a>
							
						  </td>
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
