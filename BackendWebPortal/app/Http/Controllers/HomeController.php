<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Blog;


class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        #$this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {		
        return view('home');
    }
	
	public function about()
    {		
        return view('about');
    }
	public function blog()
    {		
		$blog = Blog::select('blog.*')->orderBy('id', 'desc')->get();  
        return view('blog',compact('blog'));
    }
	public function blog_view($slug)
    {		
        return view('blog_view');
    }
	
	public function contact()
    {		
        return view('contact');
    }
	public function itsolution()
    {		
        return view('itsolution');
    }
	
}
