<?php

namespace App\Mail\PreMpdr;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class sendToUser extends Mailable
{
    use Queueable, SerializesModels;

    protected $user;
    protected $form;

    public function __construct($user, $form)
    {
        $this->user = $user;
        $this->form = $form;
    }
    
    public function build(){
        return $this->from(config('mail.from.address'), 'Pre-MPDR SMII')
                    ->view('emails.pre-mpdr.sendToUser')
                    ->subject("Form ". $this->form->no ." has been ". ($this->form->status == 'In Approval' ? 'approved' : $this->form->status))
                    ->with([
                        'user' => $this->user,
                        'form' => $this->form
                    ]);
    }
}
