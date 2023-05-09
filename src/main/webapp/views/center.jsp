<script>
    let websocket_center = {
    stompClient:null,
    init:function(){
      this.connect();
  },
    connect:function(){
    var sid = this.id;
    var socket = new SockJS('${adminserver}/wss');
    this.stompClient = Stomp.over(socket);

    this.stompClient.connect({}, function(frame) {

    console.log('Connected: ' + frame);

    this.subscribe('/sendadm', function(msg) {
      $('#content1_msg').text(JSON.parse(msg.body).content1);
      $('#content2_msg').text(JSON.parse(msg.body).content2);
      $('#content3_msg').text(JSON.parse(msg.body).content3);
      $('#content4_msg').text(JSON.parse(msg.body).content4);
      $('#progress1').attr("aria-valuenow", JSON.parse(msg.body).content1);
      $('#progress1').css("width", ((JSON.parse(msg.body).content1)/100*100 + "%"));
      $('#progress2').attr("aria-valuenow", JSON.parse(msg.body).content2);
      $('#progress2').css("width", ((JSON.parse(msg.body).content2)/1000*100 + "%"));
      $('#progress3').attr("aria-valuenow", JSON.parse(msg.body).content3);
      $('#progress3').css("width", ((JSON.parse(msg.body).content3)/500*100 + "%"));
      $('#progress4').attr("aria-valuenow", JSON.parse(msg.body).content4);
      $('#progress4').css("width", ((JSON.parse(msg.body).content4)/10*100 + "%"));
           });
        });
  }
  };

  $(function(){
    websocket_center.init();
    center_chart01.init('c1');
    center_chart02.init('c2');
    // chart01.init('c1');
    // // setTimeout(() => chart01.init('c2'), 150);
    // // setTimeout(() => chart01.init('c3'), 300);
    // chart02.init('c2');
    // chart03.init('c3');
  });
</script>

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
  <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
  <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
          class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
</div>

<!-- Content Row -->
<div class="row">

  <!-- Earnings (Monthly) Card Example -->
  <div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-primary shadow h-100 py-2">
      <div class="card-body">
        <div class="row no-gutters align-items-center">
          <div class="col mr-2">
            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
              Earnings (Monthly)</div>
            <div id="content1_msg" class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
          </div>
          <div class="col">
            <div class="progress progress-sm mr-2">
              <div id = "progress1" class="progress-bar bg-info" role="progressbar"
                   style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                   aria-valuemax="100"></div>
            </div>
          </div>
          <div class="col-auto">
            <i class="fas fa-calendar fa-2x text-gray-300"></i>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Earnings (Monthly) Card Example -->
  <div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-success shadow h-100 py-2">
      <div class="card-body">
        <div class="row no-gutters align-items-center">
          <div class="col mr-2">
            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
              Earnings (Annual)</div>
            <div id="content2_msg" class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
          </div>
          <div class="col">
            <div class="progress progress-sm mr-2">
              <div id = "progress2" class="progress-bar bg-info" role="progressbar"
                   style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                   aria-valuemax="100"></div>
            </div>
          </div>
          <div class="col-auto">
            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Earnings (Monthly) Card Example -->
  <div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-info shadow h-100 py-2">
      <div class="card-body">
        <div class="row no-gutters align-items-center">
          <div class="col mr-2">
            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
            </div>
            <div class="row no-gutters align-items-center">
              <div class="col-auto">
                <div id="content3_msg" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
              </div>
              <div class="col">
                <div class="progress progress-sm mr-2">
                  <div id = "progress3" class="progress-bar bg-info" role="progressbar"
                       style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                       aria-valuemax="100"></div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-auto">
            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Pending Requests Card Example -->
  <div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-warning shadow h-100 py-2">
      <div class="card-body">
        <div class="row no-gutters align-items-center">
          <div class="col mr-2">
            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
              Pending Requests</div>
            <div class="row no-gutters align-items-center">
            <div class="col-auto">
            <div id="content4_msg" class="h5 mb-0 font-weight-bold text-gray-800">18</div>
            </div>
            <div class="col">
              <div class="progress progress-sm mr-2">
                <div id = "progress4" class="progress-bar bg-info" role="progressbar"
                     style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                     aria-valuemax="100"></div>
              </div>
            </div>
            </div>
          </div>
          <div class="col-auto">
            <i class="fas fa-comments fa-2x text-gray-300"></i>
          </div>
      </div>
    </div>
   </div>
  </div>

</div>
<!-- Content Row -->

<div class="row">

  <!-- Area Chart -->
  <div class="col-xl-8 col-lg-7">
    <div class="card shadow mb-4">
      <!-- Card Header - Dropdown -->
      <div id = "c1">
<%-----------------------------------------차트 뿌릴 위치----------------------------------------------------%>
      </div>

    </div>
  </div>

  <!-- Pie Chart -->
  <div class="col-xl-4 col-lg-5">
    <div class="card shadow mb-4">
      <!-- Card Header - Dropdown -->
      <div id = "c2">
        <%-----------------------------------------차트 뿌릴 위치----------------------------------------------------%>
      </div>
    </div>
  </div>
</div>

<!-- Content Row -->
<div class="row">

  <!-- Content Column -->
  <div class="col-lg-6 mb-4">

    <!-- Project Card Example -->
    <div class="card shadow mb-4">
      <div id = 'c3'>
        <%-----------------------------------------차트 뿌릴 위치----------------------------------------------------%>
      </div>
    </div>

    <!-- Color System -->
    <div class="row">
      <div class="col-lg-6 mb-4">
        <div class="card bg-primary text-white shadow">
          <div class="card-body">
            Primary
            <div class="text-white-50 small">#4e73df</div>
          </div>
        </div>
      </div>
      <div class="col-lg-6 mb-4">
        <div class="card bg-success text-white shadow">
          <div class="card-body">
            Success
            <div class="text-white-50 small">#1cc88a</div>
          </div>
        </div>
      </div>
      <div class="col-lg-6 mb-4">
        <div class="card bg-info text-white shadow">
          <div class="card-body">
            Info
            <div class="text-white-50 small">#36b9cc</div>
          </div>
        </div>
      </div>
      <div class="col-lg-6 mb-4">
        <div class="card bg-warning text-white shadow">
          <div class="card-body">
            Warning
            <div class="text-white-50 small">#f6c23e</div>
          </div>
        </div>
      </div>
      <div class="col-lg-6 mb-4">
        <div class="card bg-danger text-white shadow">
          <div class="card-body">
            Danger
            <div class="text-white-50 small">#e74a3b</div>
          </div>
        </div>
      </div>
      <div class="col-lg-6 mb-4">
        <div class="card bg-secondary text-white shadow">
          <div class="card-body">
            Secondary
            <div class="text-white-50 small">#858796</div>
          </div>
        </div>
      </div>
      <div class="col-lg-6 mb-4">
        <div class="card bg-light text-black shadow">
          <div class="card-body">
            Light
            <div class="text-black-50 small">#f8f9fc</div>
          </div>
        </div>
      </div>
      <div class="col-lg-6 mb-4">
        <div class="card bg-dark text-white shadow">
          <div class="card-body">
            Dark
            <div class="text-white-50 small">#5a5c69</div>
          </div>
        </div>
      </div>
    </div>

  </div>

  <div class="col-lg-6 mb-4">

    <!-- Illustrations -->
    <div class="card shadow mb-4">
      <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Illustrations</h6>
      </div>
      <div class="card-body">
        <div class="text-center">
          <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;"
               src="img/undraw_posting_photo.svg" alt="...">
        </div>
        <p>Add some quality, svg illustrations to your project courtesy of <a
                target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>, a
          constantly updated collection of beautiful svg images that you can use
          completely free and without attribution!</p>
        <a target="_blank" rel="nofollow" href="https://undraw.co/">Browse Illustrations on
          unDraw &rarr;</a>
      </div>
    </div>

    <!-- Approach -->
    <div class="card shadow mb-4">
      <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Development Approach</h6>
      </div>
      <div class="card-body">
        <p>SB Admin 2 makes extensive use of Bootstrap 4 utility classes in order to reduce
          CSS bloat and poor page performance. Custom CSS classes are used to create
          custom components and custom utility classes.</p>
        <p class="mb-0">Before working with this theme, you should become familiar with the
          Bootstrap framework, especially the utility classes.</p>
      </div>
    </div>

  </div>
</div>

