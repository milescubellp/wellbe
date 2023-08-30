@extends('admin/layouts.backend')
@section('title', 'Add Customer')
@section('content')

<div class="row">
	<div class="col-md-12 grid-margin">
	  <div class="d-flex justify-content-between flex-wrap">
	  <div class="d-flex align-items-end flex-wrap justify-content-between w-100">
		  <div class="me-md-3 me-xl-5">
			<h2>Add Customer</h2>
		  </div>
		  <div class="d-flex">
			<i class="mdi mdi-home text-muted hover-cursor"></i>
			<p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;Dashboard&nbsp;/&nbsp;</p>
			<p class="text-primary mb-0 hover-cursor">Add Customer</p>
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
			<form role="form" action="{{ asset('admin/add_customer_action') }}" method="POST" enctype='multipart/form-data'>
			@CSRF
			<div class="row">
				<div class="form-group col-6">
					<label for="exampleInputEmail1">Name <span style="color:red;">*</span></label>
					<input type="text" name="name" class="form-control @error('name') is-invalid @enderror" id="exampleInputEmail1" placeholder="Name" value="{{ old('name') }}" required>
					@error('name')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>
				<div class="form-group col-6">
					<label for="exampleInputEmail1">Email <span style="color:red;">*</span></label>
					<input type="email" name="email" class="form-control @error('email') is-invalid @enderror" id="exampleInputEmail1" placeholder="email" value="{{ old('email') }}" required>
					@error('email')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>
				<div class="form-group col-6">
					<label for="exampleInputEmail1">Code <span style="color:red;">*</span></label>
					<input type="text" name="code" class="form-control @error('code') is-invalid @enderror" id="exampleInputEmail1" placeholder="code" value="{{ old('code') }}" required>
					@error('code')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>
				<div class="form-group col-6">
					<label for="exampleInputEmail1">Mobile <span style="color:red;">*</span></label>
					<input type="text" name="mobile" class="form-control @error('mobile') is-invalid @enderror" id="exampleInputEmail1" placeholder="mobile" value="{{ old('mobile') }}" required>
					@error('mobile')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>
				
				<div class="form-group col-6">
					<label for="exampleInputEmail1">{{ __('Password') }} <span style="color:red;">*</span></label>
					<input type="password" name="password" class="form-control @error('password') is-invalid @enderror" id="exampleInputEmail1" placeholder="Password" value="{{ old('password') }}" required>
					@error('password')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>
				
				<div class="form-group col-6">
					<label for="exampleInputEmail1">{{ __('Confirm password') }} <span style="color:red;">*</span></label>
					<input id="password-confirm" type="password" class="form-control" name="password_confirmation" Placeholder="Confirm password" required autocomplete="new-password">
				</div>
				
				<div class="form-group col-6">
					<label for="exampleInputEmail1">{{ __('Profile') }} <span style="color:red;">*</span></label>
					<input id="files" type="file" class="form-control @error('profile_pic') is-invalid @enderror" name="profile_pic" required>
					@error('profile_pic')
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
<script>
	$(document).ready(function(){	
		$(document).on("click",".addNew",function() {
		//$('.addNew').on('click', function() {
			var removeLink = '<a href="#" class="btn btn-info btn-sm delRow"><i class="fa fa-trash danger" aria-hidden="true"></i></a>';
			
			/* var row1 = $(this).closest('tbody').find('tr:last-child');
			
			row1.find('a').attr('class', 'delRow');
			row1.find('a').html('<i class="fa fa-trash danger" aria-hidden="true"></i>'); */
			
			var row = $(this).closest('tbody').find('tr:last-child').clone();
			
			row.find('a').attr('class', 'btn btn-info btn-sm delRow');
			row.find('a').html('<i class="fa fa-trash danger" aria-hidden="true"></i>');
			
			/* row.find('td:nth-child(1) .question').val('');
			row.find('td:nth-child(2) .answer').val('');
			
			row.find('td:nth-child(1) .faculty_name').val('');
			row.find('td:nth-child(2) .faculty_designation').val('');
			row.find('td:nth-child(3) .faculty_profile_image').val(null);
			
			row.find('td:nth-child(1) .alumni_name').val('');
			row.find('td:nth-child(2) .alumni_designation').val('');
			row.find('td:nth-child(3) .alumni_profile_image').val(null);
			
			row.find('td:nth-child(2) .course_id').html('');
			
			row.find('td:nth-child(5) .reg_fees').val('');
			row.find('td:nth-child(6) .fees_year').val('');
			row.find('td:nth-child(7) .course_duration').val('');
			row.find('td:nth-child(9) .scholarship').val('');
			row.find('td:nth-child(10) .incentive').val('');
			row.find('td:nth-child(11) .actual_price').val('');
			row.find('td:nth-child(12) .discount_price').val(''); */
			
			$(this).closest('table').append(row);
			//$(this).closest('table').prepend(row);

			 //register for the 'removeLink' on click, so that it deletes the row
			row.find('a').click(function(){
			   $(this).closest('tr').remove();
			}); 
		});
		
		$('.delRow').on('click', function() {
			
			 //register for the 'removeLink' on click, so that it deletes the row
			//row.find('a').click(function(){
			   $(this).closest('tr').remove();
			//}); 
		});
		 
	});
</script>
@endsection