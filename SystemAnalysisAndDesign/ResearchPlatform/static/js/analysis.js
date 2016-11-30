jQuery(document).ready(function($) {
	//Get the context of the canvas element we want to select
	var ctx1 = document.getElementById("myChart1");
	var myChart1 = new Chart(ctx1, {
	    type: 'bar',
	    data: {
	        labels: ["衣扬","陈铭津", "陈纪云", "陈雅雪", "孔方圆", "陈福华"],
	        datasets: [{
	            label: '随机数',
	            data: [12, 19, 3, 5, 2, 3],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        responsive: false,
	        title: {
	            display: true,
	            text: '基于随机数为数据制成表格'
	        },
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero:true
	                }
	            }]
	        }
	    }
	});
	
	var ctx2 = document.getElementById("myChart2");
	var myRadarChart = new Chart(ctx2, {
	    type: 'radar',
	    data: {
		    labels: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
		    datasets: [
		        {
		            label: "随机数组1",
		            backgroundColor: "rgba(179,181,198,0.2)",
		            borderColor: "rgba(179,181,198,1)",
		            pointBackgroundColor: "rgba(179,181,198,1)",
		            pointBorderColor: "#fff",
		            pointHoverBackgroundColor: "#fff",
		            pointHoverBorderColor: "rgba(179,181,198,1)",
		            data: [65, 59, 90, 81, 56, 55, 40]
		        },
		        {
		            label: "随机数组2",
		            backgroundColor: "rgba(255,99,132,0.2)",
		            borderColor: "rgba(255,99,132,1)",
		            pointBackgroundColor: "rgba(255,99,132,1)",
		            pointBorderColor: "#fff",
		            pointHoverBackgroundColor: "#fff",
		            pointHoverBorderColor: "rgba(255,99,132,1)",
		            data: [28, 48, 40, 19, 96, 27, 100]
		        }
		    ]
		},
	    options: {
    	        responsive: false,
    	        title: {
    	            display: true,
    	            text: '基于随机数为数据制成蛛网图'
    	        },
                scale: {
                    reverse: true,
                    ticks: {
                        beginAtZero: true
                    }
                },
                scales: {
		            xAxes: [{
		                display: false
		            }]
		        }
	    	}});

});