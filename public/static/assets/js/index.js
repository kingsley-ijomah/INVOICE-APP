$(function () {
    $('#container').highcharts({
        chart: {
            type: 'line'
        },
        title: {
            text: 'Monthly Average Invoice'
        },
        subtitle: {
            text: 'Invoice'
        },
        xAxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        },
        yAxis: {
            title: {
                text: 'Money (GBP)'
            }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: true
                },
                enableMouseTracking: true
            }
        },
        series: [{
            name: 'Company A',
            data: [5000, 4800, 7000, 5600, 6000, 4800, 9000, 5000, 6000, 6600, 5000, 7000]
        }, {
            name: 'Company B',
            data: [5000, 4800, 6000, 4600, 6000, 7800, 9000, 6000, 6000, 6600, 4300, 5400]
        }]
    });
});
