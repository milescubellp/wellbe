@extends('admin/layouts.backend')
@section('title', 'Edit Mood')
@section('content')

<div class="row">
	<div class="col-md-12 grid-margin">
	  <div class="d-flex justify-content-between flex-wrap">
	  <div class="d-flex align-items-end flex-wrap justify-content-between w-100">
		  <div class="me-md-3 me-xl-5">
			<h2>Edit Mood</h2>
		  </div>
		  <div class="d-flex">
			<i class="mdi mdi-home text-muted hover-cursor"></i>
			<p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;Dashboard&nbsp;/&nbsp;</p>
			<p class="text-primary mb-0 hover-cursor">Edit Mood</p>
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
			<form role="form" action="{{ asset('admin/edit_blog_action') }}" method="POST" enctype='multipart/form-data'>
			@CSRF
			<input type="hidden" name="mood_id" value="{{ $moodInfo->id }}">
			<div class="row">
				<div class="form-group col-6">
					<label for="exampleInputEmail1">Name <span style="color:red;">*</span></label>
					<input type="text" name="name" class="form-control @error('name') is-invalid @enderror" id="exampleInputEmail1" placeholder="Name" value="{{ $moodInfo->name }}" required>
					@error('name')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>
				<div class="form-group col-6">
					<label for="exampleInputEmail1">Color <span style="color:red;">*</span></label>
					<input type="text" name="color" class="form-control @error('color') is-invalid @enderror" id="exampleInputEmail1" placeholder="color" value="{{ $moodInfo->color }}" required>
					@error('color')
						<span class="invalid-feedback" role="alert">
							<strong>{{ $message }}</strong>
						</span>
					@enderror
				</div>
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Description <span style="color:red;">*</span></label>
				<textarea name="description" id="description" rows="5" class="form-control ckeditor @error('description') is-invalid @enderror" id="exampleInputEmail1" placeholder="Description" required>{{ $moodInfo->description }}</textarea>
				<h5 id="maxContentPost" style="text-align:right"></h5>
				@error('description')
					<span class="invalid-feedback" role="alert">
						<strong>{{ $message }}</strong>
					</span>
				@enderror
			</div>	
			<div class="form-group">
				<label for="exampleInputEmail1">{{ __('Image') }} <span style="color:red;">*</span></label>
				<input id="files" type="file" class="form-control @error('image') is-invalid @enderror" name="image" placeholder="Specialities Picture" >
				@error('image')
					<span class="invalid-feedback" role="alert">
						<strong>{{ $message }}</strong>
					</span>
				@enderror
				<img src="{{ asset('public/uploads/moods/') }}/{{ $moodInfo->image }}" height="70">
			</div>
						
			<div class="form-group">
				<label for="exampleInputEmail1">{{ __('Add Sub moods') }} <span style="color:red;">*</span></label>
				<table class="table table-bordered table-hover"  id="product_table" cellspacing="0">
					<thead>
						<tr>
							<th class="text-center" >Name </th>
							<th class="text-center" >Color </th>
							<th class="text-right" >Action</th>
						</tr>
					</thead>
					<tbody id="proudt_item">
						@if(isset($moodSubInfo[0]))
							@php
								$i=1;
							@endphp
							@foreach($moodSubInfo as $list)					
								<tr>												
									<td><input type="text" class="form-control sub_mood_name" name="sub_mood_name[]" value="{{ $list->sub_mood_name }}" /></td>
									<td><input type="text" class="form-control sub_mood_color" name="sub_mood_color[]" value="{{ $list->sub_mood_name }}" /></td>
									<td>
									
									@if($i==1)
										<a class="btn btn-info btn-sm addNew" href="javascript:void(0);" /><i class="fa fa-plus-square" aria-hidden="true"></i></a> 
									@else
										<a href="javascript:void(0);" class="btn btn-info btn-sm delRow"><i class="fa fa-trash danger" aria-hidden="true"></i></a>
									@endif 
									
									</td>
								</tr>
							@php
								$i++;
							@endphp
							@endforeach
						@else
							<tr>												
								<td><input type="text" class="form-control sub_mood_name" name="sub_mood_name[]" /></td>
								<td><input type="text" class="form-control sub_mood_color" name="sub_mood_color[]" /></td>
								<td><a class="btn btn-info btn-sm addNew" href="javascript:void(0);" /><i class="fa fa-plus-square" aria-hidden="true"></i></a> </td>
							</tr>							
						@endif
					</tbody>
				</table>
			</div>
			
			<div class="form-group">
				<label for="exampleInputEmail1">Status <span style="color:red;">*</span></label>
				<select name="status" class="form-control" required>
					<option value="E" @if($moodInfo->status=='E') selected @endif>Enable</option>
					<option value="D" @if($moodInfo->status=='D') selected @endif>Disable</option>
				</select>
				@error('status')
					<span class="invalid-feedback" role="alert">
						<strong>{{ $message }}</strong>
					</span>
				@enderror
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